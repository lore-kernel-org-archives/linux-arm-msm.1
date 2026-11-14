Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645024;
	b=ba6YrHSzZi6dAtAMuaQPQx5bnfCUBdfAQhQhp7pwpyQDFen+aTLgY/nc8KrP2XQQuLv5
	 qZpnz5rOH70PRTOqdrz8lZDIrjdLhJUf4vy/lUvpuSjaR62RhynS6zmXhEVtF7TGLqrum
	 4XaSJnTnCSwoZ3U5A4adJ64I87z2GixI2UocEIo4N5VcO2x2+n1IOYXlPyGPmft4wMK7g
	 H1WSmMUJqT+OC5WGaqBoNesfL+21CnL04+CeRx/hmnMp283QipXdfHLCp5H54Y3XCkr+6
	 x3dkYz76EjP36B1Uved0gcedTTSWHM0Le26ZMyd4NKkTKRcS1UonAKR0XjJrc/xUxAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
	b=qySpVmI1gBbwv1+MsjMk3SrIlSiNbNaTC9vV79oHJJmGoMPh288+G0dqKKNn6F4gTVzD
	 +ecb5aTJ14714fUpbP/YJMiweKRF4OvSVcs0XFwc9934VKVRxY7bxrowuApXqeu4fsHVH
	 kZDsM7d2gkZJZL759cWHpfZJ/1EGAYABCZ9fTElgtQ69QRW3xIINA5Av8PRXRX9+amnIy
	 4AtxwO6o2pzEwem4k2RWs4euiahIPsI/yzp29HTylldtF3mPII80v0CE1gSOBBwHuLo/b
	 wzBOSvomUFZuHHqMSpRitphFkArOXhT+c3GsSNO7uO3gppCtEyoxJwpPrAt9r4+JtBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qR56hQY;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B692606A333
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B692606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qR56hQY
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4b769975b2bso5555655e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 00:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645022; x=1795249822; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
        b=0qR56hQYIKWdOxVpc5j13KSOTAd8LvtSa09xdM/++9azQASY01VaY2/N7bIxkzHVQV
         uneV7DRJvWG+VRc6KRO66LSYMhG9aTuwpSiOFSv73W/DzetcCerEDzEnoxAr8js528EH
         nUTPKaAk8M3xhZbjAxaodYkT3bJ3vZzUrc8MD3nwb5I89mxzZ8VSalVq5w8Os3SC7Yv5
         Qab1tXA+MtQNKeBlFZJ32hBa4E++V/vEjpv+ymFD9oARpQcuAHbq1J9fnvsG2w1J6B2B
         xudgu0dFaFOYv9/QgA48S9Cxy+NlxC5paDnWBPdOaMkesuzTTvsuRwlZ24sDoPMGS3qR
         kEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645022; x=1795249822;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
        b=o47pZfsWVKLD8/x88pSzkw4c4SCLOAq7Usvd8xLBkPAXBkwyQiNAegnidw08DQyfXV
         EHGGQRi8GF52+c31W5KLtdrUJqz3Ttmqqo2P2Xit+skNaE9IDe7KQCh42rTi4m4pp5xX
         xET6inUUq8uirwEBU6mPjsqM3Mrbfp5oZRQudA1SWDYeYPCXw1F7iFmxM8u7aC5RKVLt
         qwFxWuoNgtkwN9qGelEWsY+lsvOS99QjL5zgz1JZFR8qCijib1ni7BQNg2jvOsRWVJ40
         auuFjOpql2QcKjwt3+2DhgdyviL0KliE1xuHgFiSr2gmh75X7r+RGNukuvFi7LJm8goi
         PF3Q==
X-Forwarded-Encrypted: i=1; AL+hErFYLUuBhvxPQh5+gTD62ZK27malZK78YI3MLRu8yvI7SuUKR8XaMJ30V1IPnHFy/ohcWtHaWDfzagxWvxvs@vger.kernel.org
X-Gm-Message-State: APuU4Z8HyvHWFOv/rrvXtYRNmZuVaEThHfb9hKt1AuFSinuyJJha+/eO
	0AHJBqiyRrK6K96Whxfwsa8f7BvS+VTw1rvJGk2M/ou5ZMrVvLade0/S
X-Gm-Gg: AYBFou0bSwFSBxLptC1Fw+YJXJ8N++fu7YF8sG8bbaUO20BZToL1ubTjQZiNeBXHGgX
	/yJaxYUrQE9LoBzfAWAdYAqZEnFMTWaCddRjHlAQLKRC45HlpVIJGT3q2m5kNK0/qnHa3Cb5+KS
	yFktBdePY4OcuUVfc/LrmYH5AnH+AQpr2IBmiZmHvNLrbREe95z6TNnJNe+yQOoIYWnhdbZeEEi
	Z83oaUAym4sGmXWHfZOWWPRMOvIWUMBF+l2sqzoRsyHlcVWtZ1oV2XhQhDqyVXeigN9E89bkNwD
	gnlhDE+0GrQwCF3twkiOPRzkLbgGaCZ6SFulqrNo4M2SCWEuKkBb/YhLGCpDmVouMdkftROq0t8
	GKXea5znC4iMofYxik5HBQOcrUXBHcZojc8YuUolqZHxcoE42idLnmTx441VHJAE6HANRyIF6qw
	SMfsqFALIrVDkNeAher+UDH4hD8dGo6jtwR+y7+axsiFAjVbiV2iISG/nD7FVGc2Zug5a59Hcrn
	81tmZUQIK4x8xjwfoSR6SRt3NZoSNEdZa3qNx2SrqxNaN3SdZTh
X-Received: by 2002:a05:600c:2c7:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb55a71180mr65200945e9.28.1794645022425;
        Sat, 14 Nov 2026 00:30:22 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:20 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <ffa1da6790284f668c860bd21203014e@gmail.com>
In-Reply-To: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKFB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJmMWIwYjRlZiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKQEAg
LTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRlbXM6CiAgICAgICAg
ICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYteDE2MDdxYQogICAg
ICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAgICAgICAgLSBocCxv
bW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5rYm9vay0xNgotLSAK
Mi41NS4wCg==
