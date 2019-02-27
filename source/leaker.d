module leaker;

struct LeakerRange
{
    string[] characters;
    size_t cnt;
    size_t len;
    this(string[] characters, size_t length)
    {
        this.characters = characters;
        this.len = length;
        cnt = 0;
    }

    @property front()
    {
        size_t tmp = cnt;
        string result;
        foreach (i; 0 .. len)
        {
            result = characters[tmp % characters.length] ~ result;
            tmp /= characters.length;
        }
        return result;
    }

    void popFront()
    {
        cnt++;
    }

    bool empty()
    {
        return characters.length ^^ len <= cnt;
    }
}
