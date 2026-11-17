Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884916;
	b=EkS7gNl4c1/L/1lL8EOjZBuQ5GmXqvJRzPfs0mUMXUXVOWh12fHgBJ5QJA/3qsVgLBDM
	 Z2c/xFLui2JGm/kyiErFfzMVsz3Ulam9RSnDimElVkN1vNsX75Lt7jX6t28Hz7N5lcMdp
	 nwNkgv3n0sgUToRybubCNDGxq8S2ogeAjx5pT/F6/87WgInlppsTXFXLyaxvZrJFa3Vmw
	 P6JBw0PXwj8MVfYXfJWh93UnAJAMdOA5XRlunJoB/HpS0KazxPELegoknNRwTvB+q/gXZ
	 s/xut1XHO6GS/nJjAJda4vv74g2aB1RBcy7OMnTcmSuX+4R+owZy2PGoHaWsMXTnBDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=w+Y3p4UcYcjN90HcYXfFfPpl0FynM3uDCS4/JoEqrWk=;
	b=Rad3mR1EyJEMsdEeta6GzPxZHUN0LdcGR7n1jCxQWBHHinqQKyW0nYrnaw+q8C1Mqk+C
	 Fgk0df+zm/gApD5TLe87PK/jq2ES1w+6iPG4sECNdaRZ0t8lK4TpDZfuWE8JLlBHb9mgf
	 NNcM2m3NRtlc2h5HzGmKiLFGVQdk1Z+E50RWlJRGgRjCwmG7l1oe86XFf0iG+pI/pYF24
	 GftumAS/IMxIZFIRHZcXqtMfvW2LHRO0WMfRAHMmvZkmzkEwU7hlrCgfuhKYPXN+1Uro/
	 AI/+oQhOSwedFgxIArjpcat0eq5mv4lf14n13+2N9b//+2e8hFueki+rvsQOE2NkZ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBkv9UQO;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67276606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 03:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67276606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBkv9UQO
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-94961ed97bcso362582985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 19:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884915; x=1795489715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+Y3p4UcYcjN90HcYXfFfPpl0FynM3uDCS4/JoEqrWk=;
        b=VBkv9UQOOPEmqtLq2jGc1a9+225+MsIBCZBLqH3Tc7s9QB0MBXyOp3M/H8VNA4o1A0
         CLDcAfHKCej8L81PwawUkfoaPTILZZeH57wo2RmqGs4mu5NmrRLaQElQAww3dqCfh6MR
         qykJ6abRYcl67Nv5XKY2o9EHkZBli0VTgEu0N3iUio0rXoPEZGtZ0SHJQUEIc24QKi7V
         jYLOgUFpGKGZCNgYeXrStIwnhV9tFtAKGVSJz6/zHPTBXGYE7X6mSQcMWLs98xVI1FQn
         qLcN68G1XA5PswLF62/o9SbRCkR+iw4tHcqS82QC9pxY+oQ3OO6miorvL7CkXd/UAHwt
         8ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884915; x=1795489715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+Y3p4UcYcjN90HcYXfFfPpl0FynM3uDCS4/JoEqrWk=;
        b=0UBeHgFPX9X01vR/GvWnvksNj7OljCccBl5YYlukmjayKkjPDU2GB30OgsrUkSucVy
         pa7rkV56sD6mZ+g3ybqE5T6h012h6aY7Tka+F5jjqS3LDMYZ7SkrrNDj8eMnAKMQE/Gj
         P2HDf8zm3cz3+mt/tE/o+dkXuIoasWYKmeWsn1PAyPooWxWGy0keYLI7B+GbcHY8f/qq
         kAF7oPqZoIUviEbPvlwugJY26vbxr/KXz4m1FLv7hMwzQFDdipENgO681ALS0yomzN1A
         //B4/GWSZKNxYbsaQh+Tn2/MQxK73LSbjy3DxKdpxyTgqi5qBMOc7HXV2QAOzd+1dPcW
         l05Q==
X-Forwarded-Encrypted: i=1; AL+hErH+p06ITrPZqvlOHDQxz+OphXynacabR3vP8s890SnJje5xJxv9eIRBcxxjcftSbthjs8aq024ze6+F0gdr@vger.kernel.org
X-Gm-Message-State: APuU4Z985JJaKFqdopw6cnr8A5Dgh2Ba7OCfMvbMR3JfmouRpkfii5yx
	Ef10wLKy6WW994atyKvpJMDAD44GjXuwfMHqF7GQ66i6pr3GTZKper+T
X-Gm-Gg: AYBFou1J9DG7etQfJBNRjvG48XsD5tNBpgAaKznY14xW3HECPSqhCluIXxOAlTAwI/G
	BhRiphvyYWk6v6R5wvigX5MmcZVH3aFRh8QKnmmxzTLVXCqSArVy7Hh02ccwPvOMJ8buOktQaP8
	2sgBZqIENLk3YfgsPuC0k+++lQRJBweJeS1jhRwKFGLWdLiIygAHhkGYSVDcYwfhP2Y/0Y8qDqP
	zvmh0EOJxc6/azVC1boMTEC+StC8hoDM/CDo0V2S4/rcf19ivG97bRZ0S5n8BmmywefxJ9ALO4x
	tpvXTjjsZHMKVIkaM4BEbAUZgojIciRuy84eGo30XGeQaenVnpbKK8m0TS3RjBaH4z7rm9J1wE5
	rN1eiQstflFIr7GE9a2/UTFe6j5k0ea4LKB9Ng4ZQCDs2zG2Lsp614wc5oHexnIUBtlTH2tinUe
	kM4Z2JraPaQdTzWnxUgirAypftFmTrjG8Ym+Rm4rBRXHtI6o+wZto0MBrLWfRrXCgd7UreDtM5t
	wtfmzy/8lFszM92GSd7/SgCw0Q29BTA0tWPJgp9AV2uJ1+Xa4AWh5uS7o5zNQqkAFtTwvTN7fYp
	g41o/+Tfr2wFTwDGWa9pIALhoCmLF7HS7CwDOqxsjpeh3+aDDs0QY8+nZfQm7mm6oAP4OqWQOQT
	sdk4B5vxQqXe0kNxun3Vtvv7M3Sada/7/muUgGhYamESgdVloWIJY
X-Received: by 2002:a05:620a:2a10:b0:93f:2eaf:64d6 with SMTP id af79cd13be357-9494bb90266mr2006054585a.48.1794884915318;
        Mon, 16 Nov 2026 19:08:35 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803fb4sm981181585a.9.2026.11.16.19.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:08:34 -0800 (PST)
Message-ID: <93f7aabc-4a92-4d3c-a6af-a84b461c0e0c@gmail.com>
Date: Mon, 16 Nov 2026 22:08:34 -0500
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
Subject: Re: [PATCH RFC v2] bus: mhi: host: pci_generic: Add MBIM-mode config
 for generic SDX65
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, daleyo@gmail.com,
 Johan Hovold <johan@kernel.org>
References: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
 <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/13/26 1:53 PM, Jeff Hugo wrote:
> On 11/10/2026 6:06 PM, Haipeng Lin via B4 Relay wrote:
>> From: Haipeng Lin <jimmie.lin@gmail.com>
[...]>> Boards with a Qualcomm-ID modem in MBIM mode have so far been told
>> apart by subsystem ID, like the SC8280XP CRD's SDX55 (17cb:010c).
>> This modem carries the generic subsystem ID, so select an MBIM
>> configuration by machine compatible instead.
> I'd like it if we could query the hardware to determine if it is in this mode as maybe one of these systems has a SDX65 dongle attached where this workaround does not apply.  However, I am failing to identify such a mechanism so what you have proposed seem to be the best solution so far.
> 
> Unless someone identifies a better idea, this seems reasonable given the situation.
> 
> -Jeff

Hi Jeff,

Thank you for your reply. I tried to look for a hardware hint since we
have to select the channel layout before opening a channel (so that
can't be the way to select MBIM, I think). The oem_pk_hash on this SP11
SDX65 is non-zero (12 words) so it could potentially tell this module
apart from a dongle, but using it would mean reading BHI before the
controller is registered plus adding a table of hashes in the driver.

I can try the hash route if preferred. The machine match is simpler
although it wouldn't cover the situation e.g., a SDX65 dongle is attach-
ed via PCIe tunneling/USB4 you mentioned...

Best,
Haipeng

