Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170412F8EA6
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784567008; cv=none; b=HgwQcNdvbPDZ7wJ/w5c0CsKhO1ekMzNYRx5qgL6Rk0zoeBAlZmS7O/X0y5wLTBl9MMm/b2RzHj8oAZ1JzxD8Wo6FrezL8knAPOdQ7NFdVFli3DFdBE2hEZykYWQOggxYot4TYngK+umRQV3ENEyRjoHYHhtxBDsnBZWyj0z+Sek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784567008; c=relaxed/simple;
	bh=wj5669yyLx5WdMNuaQRw0s+F9c/U7LMRYtICst4tktI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i6LCy2C80IN7X6pVtpvLCkUl6fxMX8y3FFyGhWQ9kEI8CABpTOiCe0nEU+4wdd16hOTVvGPrx6PDcXYO3Qj26pfhYe2QBmqByasvkM6bxMmzK0dcSGGCKoJlPaAVON7xeRzm468NkMj0BiuCtP2RGToRz8I9HwvF+MXAMnkozsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=R1HPKxRW; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="R1HPKxRW"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso76142925ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567006; x=1785171806;
        h=content-type:in-reply-to:autocrypt:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoZHavppdgs80kRRaTh3bjy6R0CCGJ3Xe49f6tRPvns=;
        b=k3hzYBfm/tAMl/MEqDXOUbzhVCnuT7kNedr9qrfE+O+9yW3bUwBAX6U+5jZOfpKwpN
         Xjxh0rIjC/7cyf7PBIVPA0cCd/P9yzFAok+YFOQCxya16mf33y5WQpH9sv3LreOC87IP
         FSipcl8o3LUQ6kZ2wwx9EH5XjdCt6yWmasXg0xTHCOd+tlQkJL4NqhZbkrGGuYstRIwP
         SdbtBUn4GXc1FdUmCl1l5ys3RHm+rtSy9g/r9BIcJabCNU8HZ8Lw17+YduQ/CdJlDxnQ
         NCRj8jMc/iO+HsHIDc07Vd8isvAZp3YcVyagrFcEaT+N/xgEAT1hztvH90euElFQt4N9
         Zkrw==
X-Forwarded-Encrypted: i=1; AHgh+RoJx8r2KxOZN4cjHgjRW8Z7dP+7ukDFw1pPZoGRatXWrCFhhZ/RlsGKHcnQLOH9NH7nUDaw8Hjhsef8lv/Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HB1aQn/7nj4i9J1+aTAs/d2Tga7ln29Cf7oAzn6i8qMKeFtj
	VyvqJA4CcDwUP7yoCVMIXGzgqAbSWH8JQAbmucIK5tBMnTr+tMBntkQirgQLfI0b7zWjv+Cl2D3
	Ejp1Duxh3b1rwRnEBZbVEyag69FAY2A2cfN00VYtL0waJTr8ssaLY982eVapJxcKLrC2QsPtfto
	O+nbkbT6P4fPEKdosgll0guhgsi2Za/sdqWg4FkQk/XRJev7aoNvf85mOWxsd27l1BpbVG2Cy5Q
	iyEIA7lh9YHhQGgbVHqY+rf8g==
X-Gm-Gg: AR+sD11PhuD9+8YQfqJimsbze0F3OIZSExTa4HwJEB51rZ4yHIF0gJBWtqV6Wldp1QU
	TkfvG9fCPBMKi2PH4/hh2B5oQ3arqRVMqg0wf8hQUi4gTGd2LNd8XcMtbIs08/NUDODQQM5RKXL
	OuRjl/gmCQ6+M8P8PYhG9mS/1yBrqHsIBqWegN+sp7YT/1kJq3O5DwpYQQAW8LGPEJxhgMMLf+O
	stMJZVFK4iZKojJdcs0GB/dKShFc7DzkcjPyFTeQR/rkE63IwCuksyUYVXlHIThXD8Vd/LJHnHH
	CC/LAZEZloeoqLMtxgVJwPUDbI9IS/vS2A+gDXiMG2eSbGOmFN99so+AP6tqU833S6P7/jHnqHo
	24j2AOVKhS9yA/5PYazR/8KvLBXtHbdmj+4KOLr0E8J2OfQusv4Loue90Va8YpDTL4c/yl0iwtC
	C9pTIJ9qPT84fWknTe0ocq60HJozVNzYT+J6bEE1iO
X-Received: by 2002:a17:902:f681:b0:2ca:3e3f:4956 with SMTP id d9443c01a7336-2cf34a35445mr160489815ad.44.1784567006055;
        Mon, 20 Jul 2026 10:03:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cf34660c2esm10125875ad.31.2026.07.20.10.03.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2026 10:03:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-39b1937b6d6so31234171fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784567003; x=1785171803; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoZHavppdgs80kRRaTh3bjy6R0CCGJ3Xe49f6tRPvns=;
        b=R1HPKxRW82bGhR/XUeluU58ZFJfPQylM+bAixBm4xjGBPREPKPfJCCkMeCttI0GmP4
         9l3nkXTABzKw4V3kf3JYZuau1nngsPmjlqVXLUwFrlzukJJON64aR9ZPzVyA8CoxgtAw
         GMqwGM9TLpH0+RghewEzT7fIFqqtk3xUJtqn4=
X-Forwarded-Encrypted: i=1; AHgh+RqHHKpNfQfA47rac/CzrgobxQE7CGCmqYM7vUqHEv+GlGHhzBSmPD2MFe0P24dtzoK4ZnihOScya8HO3fr6@vger.kernel.org
X-Received: by 2002:a05:6512:b93:b0:5aa:8822:c945 with SMTP id 2adb3069b0e04-5b28f9b72bdmr3591661e87.47.1784566668673;
        Mon, 20 Jul 2026 09:57:48 -0700 (PDT)
X-Received: by 2002:a05:6512:b93:b0:5aa:8822:c945 with SMTP id 2adb3069b0e04-5b28f9b72bdmr3591622e87.47.1784566668133;
        Mon, 20 Jul 2026 09:57:48 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e1887esm2450178e87.59.2026.07.20.09.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 09:57:39 -0700 (PDT)
Message-ID: <b8062978-128c-4129-a803-1d02910122c8@broadcom.com>
Date: Mon, 20 Jul 2026 09:57:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] net: bcmgenet: use platform_device_set_fwnode()
To: Andrew Lunn <andrew@lunn.ch>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, brgl@kernel.org,
 driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 iommu@lists.linux.dev, netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-4-2dee93f42c54@oss.qualcomm.com>
 <ae9da5dd-3528-4270-ada0-d17ed14478e0@lunn.ch>
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <ae9da5dd-3528-4270-ada0-d17ed14478e0@lunn.ch>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000058c32c06570de2d3"

--00000000000058c32c06570de2d3
Content-Language: en-US, fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 07:38, Andrew Lunn wrote:
> On Mon, Jul 20, 2026 at 11:24:51AM +0200, Bartosz Golaszewski wrote:
>> Prefer the higher-level platform_device_set_fwnode() over the
>> OF-specific platform_device_set_of_node() for dynamically allocated
>> platform devices.
> 
> Why?
> 
> This driver is OF only. It does not support ACPI, and probably never
> will. In general, networking and ACPI don't go together, ACPI is not
> sufficiently advanced.
> 
> What is you use case here?

The driver has been, or was used on ACPI-based platforms:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=99c6b06a37d4cab118c45448fef9d28df62d35d8
-- 
Florian

--00000000000058c32c06570de2d3
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGnzCCBIeg
AwIBAgIMaT9V748TBL0gqLOFMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYxOTA4NDMwM1oXDTI3MDYyMDA4NDMwM1owgeMxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzERMA8GA1UEBBMIRmFpbmVsbGkxEDAOBgNVBCoTB0Zsb3JpYW4xFjAUBgNVBAoTDUJST0FE
Q09NIElOQy4xJjAkBgNVBAMMHWZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tMSwwKgYJKoZI
hvcNAQkBFh1mbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAK9u0aBdl51z/nEmpFSqdvC3Bu87AnBaOq1NGLM4vKTwCRuh1hSPhQOJkIB0
X3lGlHAEUufNmKYb1aeLHW2kToCe+9mr2cBXqHP0aWl/Oy/ZjQabOsXzOzE0SfGLnLfGJMLV7yFB
pwKwqxC8t5MBK+6zhQZGcnnuz9wF1tWGdczOeCmQCTO9+MlB1fNac8pKSB8bUhOSC4fr0ev7BfPA
KmfMr9BBremQmDCaHeTwYy6wZLdj4dZzGMfF6PZOLiV5DU61ehA+spBd00RbowgJfmI525dEWihB
DaLZim3cCy0sCU9GfGm2sHUX+3B0S6twomZzsrTE02PfoUuxXAqf0gMCAwEAAaOCAeEwggHdMA4G
A1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcw
AoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIz
LmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1l
Y2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0
MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNV
HR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
My5jcmwwKAYDVR0RBCEwH4EdZmxvcmlhbi5mYWluZWxsaUBicm9hZGNvbS5jb20wEwYDVR0lBAww
CgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFCuk
Rbf0cgc52/dpv3u8tk5QBzfLMA0GCSqGSIb3DQEBCwUAA4ICAQCEf8H6iR/fp2Yv2FycUR0XNfkZ
5C5jGago+UGEiNDE1ZEz27RO9dIuFrh6TPwC7Z9zkRxSSEPoXEF9UmaNZpUK9hIOLja4nh2xD83z
udss8gNXHS7AePBy6asDTxJVl+S+Ls7j1mr9udBw4WCD6pSa8PfyTKjG+zhD6BWxBuajysSfyXNJ
lQkOmI4EW0SH3VOIIwZRb1QjxFhPyJI6rqp4osvjzNY3YFtK/F1ylmGI5m0RkwtqgJ/0Lx115i9U
uIo/v/g1BPD0rQqHpVtLvfH4s75U0vw8Cd+Wg7QQUk21PxweqcwnuFakkHi6xarxwnlijKgv9vZn
5p3Gf6TWVrCD7mXWDbl4D+KndfIa6E7hc4xPUA+idcQ02s1s6lfZ36s9f/5ZY9L+BwR12LFvzKcf
JhVO78ugQDvSIrbq4lgDk4HILUi7se+UWdSWg/GvaglFs28PE9DoxG3MOX4wrbXPqpD3lrnZDFMM
uPID5U7ukJqoVbHLZU3u11CcI5k9ko1s9A1Q11sOaUcJHvma/vYz0K0mub0Li4MBym/O5K+kJ98p
sguXKkldCDDtyTm5mFBVXOqbXFDn/oBPRIcHEgjXf8xZVEU6Sh90+k87Vm91WZMWona3POJKJVhe
9sd9RXscJiiFPaZ7E2d3IHNuRetYSfVr9qZl1mOcJIB1i0f1djGCAlcwggJTAgEBMGIwUjELMAkG
A1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24g
R0NDIFI2IFNNSU1FIENBIDIwMjMCDGk/Ve+PEwS9IKizhTANBglghkgBZQMEAgEFAKCBxzAvBgkq
hkiG9w0BCQQxIgQgtguLygfxrhNVB5QxIrqOmU3TKZb0RS+lv6/SRrX5y/UwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYwNzIwMTcwMzIzWjBcBgkqhkiG9w0BCQ8x
TzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAMcm1NeFQk5PKhiZFnCbd
yTkJVIlY5GZdS/XJRDbD9oPCH681MNs8WjHI5/NzPjggkL8yFMG6IiNmIjxQhq7VZyB1GXfivM6T
tAOChHEZJYkzhVdW0uH9KTh5n/9QHRS1LDpaOHYpYzhJtjWnuNdnPPTxdXhhmGl1RmRk4Jx5G7S4
SX8Kbfd3eX9oJ6UZ9eJrk9YapohRP5q9W51mLJwN3CrAVpY0psXtVm465yh4zq6NNqAfX+x9/OCj
2dK9WpDZ62IVT15pR4M5r9W2XMlqbBPrRBJPFaji1ECKkgnrFbDNIbYF3AoSRf980PqvyhSvsyNS
l2TW9L12oL7i3c42zQ==
--00000000000058c32c06570de2d3--
