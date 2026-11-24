Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523326;
	b=eFxcnqxvuahj4toLEq4j7OBjF356u0nDqO5hfEBLmtH+3/zxUYoE9FHwrNveI+5ruxzC
	 1KC7yCg2+Xq7VKzmoiRiRpf1V7NUyP9cKiORio7m6+iPIVQybQFRhNogVwMkTZYkN43Zo
	 F+XadZKUpb8dt0ZYdbbA2QSXyQJWht2gVrxA2eYtmHTaluXrWL/fjja8PEdq8q7FbQkNP
	 wQ+OLIadOFUQB0sRwp3wJmU7nnACe6Unli4W9ogOb2RhnznHyjAi1RKqyfMJsAv/1S03h
	 vb0KZG5/lvxNFhJiVq7LrBEG2NMhYThA62rkKqlKPRtn+a/BWGy+4JC4SJP/gVmOlcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=eZhcQLcos0J5dvNvJuQcdaS5XfBtHybSILA8OS9MUy4=;
	b=TcukU9lKQ1nNZR6bxkZbCeuZz4k2DbWRhz9BjK+QbCp6BwSNfh5bTLbsPu+aq6l08vFJ
	 h/WN/cvkaw4I08HyuFjS9lYr3UA0K9QKyuwsKpN45Tlabn3jCCPj9Tg9D/wevxCPIJEDe
	 deidUvXLpxaJ/dgN04pl3P5D9ig0O1p5S9aUddEAuv4UajtHUxeUb1UqiNCJ7A9BgOmRx
	 QnVAeNDFTIukCWntwP/yZYgVnnngAL+N0sCMvy5Yut6LBX+uC7tdLo5nKXPb31GdyljPe
	 E10wsTBV6aij0cbp7zo4KpGKzcgYrd5HajTonvf0Pzxh2PVz8DeEv7HqcuGyM9qDAng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mdeJc0zF;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E626606A682
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E626606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mdeJc0zF
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso41228615e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 04:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795523324; x=1796128124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZhcQLcos0J5dvNvJuQcdaS5XfBtHybSILA8OS9MUy4=;
        b=mdeJc0zFgMONR/NIr7+cJFXQYT9CzjbZVK8K5bHdLs5owNebF6BU6Lbm+9OJDMU10Y
         yt7f+5sLgqYmVZIDmBpJ4ksEtISJb/I97RIHZbwO6MvpHEzvTiAk3fxKdlhe4KnzcOzj
         ZywLle01PUQKQXASCQztj/WDuBw56a373qOxXHDEI8c2CClJsa5dYMIz6SPbcBJ6fGs6
         EE8HLW5oohacke5/5JVwZ14wuPmHOaO5S/x37gkYucadKC7fjdMmkrsfH7WTbEm7GF7b
         +sIlmr+BFFRDH+eHJlg/ADSXxq72+jMtqdO3N/xPxEpd4/V0unSmakepAaTOry33TdW2
         vypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523324; x=1796128124;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZhcQLcos0J5dvNvJuQcdaS5XfBtHybSILA8OS9MUy4=;
        b=af8ImMmucL3PDEZYWdSZI3xJ41JTVrTB/lbw0Cu5JtreHqAN3daL7xv/ELMOKBX205
         g+Ms6T3aeyHaX/zcXk1hAthgi3Mv0va0rgi3xB5/X3jjJvjrHzOps8uiA3d1i/X1TQ0p
         WdIldZfn5vgsjAOv3hplkls+vK2atVk1Av1VSq55A9M42jlkLEzW3AG2jsInBs2OfL9/
         2ap5RXYRhkPaJeI8KlEkO9SMRHz89gwN5rSmYVM7DOOL33FZDc4EAXERXgl04I1OUEGL
         aL3zuGTvlbrbn72cEvqVPzZ6hfs5rM+uZT7sxPLcGxE6P7LXWeS42sssN4ZI998fv2EV
         MX+g==
X-Forwarded-Encrypted: i=1; AL+hErEkORsG2y4gtLT6sHA6S172obuSgrbcUWAAhm7VOm6evXFGZSRpBrRyzVoJx2cNB86cD6tb88KIqdP2Jp7X@vger.kernel.org
X-Gm-Message-State: APuU4Z/hrEAs1lXTz6Mt7aTlVifHCbMtyV9A58FkY3s+d9m6RhoTiNjZ
	qM1jkHgFQ4BjpBvkhmZR+W/pYbLTFXcuTFoQWXD198XP+kqnyuodSwbrwBUJpYsEFXI=
X-Gm-Gg: AZFdTZc/Oz2wTnwKi4Jzdqh1XCc0y2tO7Cy0boQ+U2mbEUfYUMmrjfsRYeCwz3l1JGQ
	NZtLpQlIa0lPuePZMCjLclqP74gHxJ466bTunU6fKjjh7QSXTT5vXCRrZn/DZ467xf/U308Qsu4
	3T/aXTv8qXz/vQK1S9sk9sWcM9nh2Nid3g/9yo0WtMC7VvdqnI5ESOasryvvds94h+HUx0/YFGV
	b6hw2u8NNThPJnfDDhgQKUkdQZL2x5u8jgEUT3laYsQhUEcD5SHcmyj/AkJ4vqLzLroY7FoqacP
	elvGhdwanS3nFd9yy++sr00LegjiBpJbK1YBciYtslq0pUoFLKEtaJ+OvIqLYL11yby3Mc3YBwm
	K6t611b7da2HP1b9I5If7Hsrs9G+1biULGQXCfyzHIPhVoWtpNqUZyzit8+mdbZjT9etw5lRifv
	MgeP2kXGV6k0ahuDNPkNgJGzO3w5P0aKfYZikKhKH6+O+RYfk7Gt8zJVGrDoFNVX3i2Jb6qAwjF
	OXxj0yc90wisFnGntJab+nj1xospbWvL3u20NZzL/WA9Q7u2dVuDhT6d9QT+SDYj26zxvru1IzT
	OZyP5raPWCdC8O7luHYRoktLFZGz0hSluZSg8O+n0RY=
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb8880cf84mr300507395e9.16.1795523323754;
        Tue, 24 Nov 2026 04:28:43 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm432306495e9.5.2026.11.24.04.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:28:43 -0800 (PST)
Message-ID: <08b9a714-278b-4e1c-81c8-59a60dba5916@linaro.org>
Date: Tue, 24 Nov 2026 12:28:42 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF
 timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
 <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
 <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 12:20, Loic Poulain wrote:
>> On 23/11/2026 17:16, Loic Poulain wrote:
>>> +static u64 __csid_sof_timestamp(struct csid_device *csid, enum csid_iface iface)
>>> +{
>>> +     u32 lo, hi;
>>> +
>>> +     /*
>>> +      * The pair is latched on SOF rather than counting, so it can be read
>>> +      * one word at a time without tearing.
>>> +      */
>>> +     lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
>>> +     hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
>>> +
>>> +     return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
>>> +}
>>> +
>>>    static irqreturn_t csid_isr(int irq, void *dev)
>>>    {
>>>        struct csid_device *csid = dev;
>>> @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>>                iface_val |= status;
>>>
>>>                if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
>>> -                     csid_sof_event(csid, i, 0);
>>> +                     csid_sof_event(csid, i, __csid_sof_timestamp(csid, iface));
>>>        }
>> I think a callback in csid_sof_event() might be cleaner or some other
>> way to not have to replicate all of __csid_sof_timestamp() for each CSI
>> decoder.
> I added it as a parameter because it is provided in much the same way
> as the sequence number, given that the timestamp is directly related
> to and coupled with it. So it is not clearly obvious why the sequence
> number should be passed as a parameter while the timestamp should not.

But pretty much every hardware implementation will have to do the above 
function. I'm asking for more functional decomposition.

You could pass the hi/lo for example and make the sof_timestamp() 
function common - called once from inside of csid_sof_event()

---
bod
