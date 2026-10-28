Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201033;
	b=5jYTKGcIIvsSA6g74mIy2tDw42gmlhAPooZMbF4IVwWB9MQFTmUe/IVFL5/HWx6WjhYj
	 j5vCF2uSWhF/OcvcrTD5GI4BqQP8LJhI1LqxW4KeEJ8ONf7RlkpZ9ISWvClW5h96Dij+1
	 YxD0t620adcEfq3f+dAxsicuOb0rzRW+BCbFMidtR+2wyqqNVmCIrncXI7Q7x1JkDFfa0
	 n0Ioi7Pq4TXxEd0fCn+RxIVyaEFQ0Arv9JS8GQ/+LuFa5fTSKpLfIndAGeDEpeD2+9J3g
	 UJhQ3FiVeQKUfBRpw8VFSYKaqeQzokfNQZH3zqKpF47613Z9XVM3qdoENuLtWWToDLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dl9wCZd7aXQK3/hvAJmLj2CWEPQf32CA5XL7IGwgTcI=;
	b=pXc7KQEPlfReDeO3QnMuBRsUiLgD0ZP/E5iCilPjIjg79HxWBtcSacEePvydlcf/dTQM
	 gvNv+B24GPSke4W/SiDA0v8CteHoQJca4rSVH3nUfs+8/qW1tAxP47nFHzkBfPFb86OT4
	 4PTqImKOYoiek0Dgye4iBKgMZ6sECyUZMigne87A+mlwBSikRO1JtRN+yjots25Qq4dmK
	 +15LBLGQobWNNFB9fZxH3Mjz4M2m/EAQZBghLDZVDgcwvF66hOHWOOystuZUgWoIp95Pp
	 UBCGskAhaAmVVP/pRTYv2dD3ytC7Tkyvq8UnS98K0NYOTlzraCLbu7s/uZ2645wo2+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxyQpW7d;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721F7606A33A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721F7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxyQpW7d
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd3310348d2so1020086a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201033; x=1793805833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dl9wCZd7aXQK3/hvAJmLj2CWEPQf32CA5XL7IGwgTcI=;
        b=IxyQpW7do0qxjdLnTW6gqcE2/Kvp+2GHGCZ2MrrfbYY2HmdYMU1kubUOaxo7vBeNsK
         6eRBKUWSj8dNOJ//L0iAORMgRsN/CEXWLyrs/dzrmfMnqigUw3WqrXmwmxKV9ZwqEOvV
         5K92gq2TP/S9LR6OTBVusC6um+6R+vOby+5H7ZuVzqaSojFF7/Ppq+TY2RGgSpov2TkN
         OatuoAwCPRMKwY2qD0s/CN9tq6269QEqEUgFcT5P6L/580mCVd2K5aN/QzSk2a6tpoKJ
         cUau0swhG9ztvjsTumASrXTd1mQh2W/RyDwzwyffjZRKuZ79S+lytPXwiLzctcx+YyqD
         rVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201033; x=1793805833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dl9wCZd7aXQK3/hvAJmLj2CWEPQf32CA5XL7IGwgTcI=;
        b=arYveK9w3QmbZSxYmtYKlYtoc+js3QMd/nImI0rHMKq6Yivy3gH/KmrKEH2be1fWJc
         1xcf1o+dcq2d+CmHVlgg5id+Ti00RQgAxJlmLpDTghjR85NnHHKXeKQq8Ey5tCJSHjFf
         HisiAQex7xJe3DEec9ph2qsb1iTD5kP32BhU1p8w69cSjpthQ8Q9l58Lp1Q0zpIPadXl
         17KEEXpEeMXxwMaJ40uJPbGwV2Hk+fFt0h5NoiZ0o5mqxTLgicqZIwUOoMNXVJ9Wggeh
         P9aJnxaSJq2cXuTZho5IwT3i9dl90mso0pAe3TKI1Xfnnbj77yR9pnIKTdmujtr39eL4
         cpNw==
X-Forwarded-Encrypted: i=1; AKwUvBwSJIiFHSXlWPL03yLSiJomY7mx/DLZziQKi03ntSfc/ll5mibd5gB/5GqhZIMMqmS6Qa3zcq330qVhyDmS@vger.kernel.org
X-Gm-Message-State: AFq9FYLUk9lEZqC740bfkLRe3vkEC/eolum6Q4ymx8v6hZTWzOIEZGkK
	3Eiz66eAnqVhyzhmWmnEB5LEs6kROCS1TnfBcW5eshT6hiAxQOLsZHE=
X-Gm-Gg: AYBFou2g/XTy68eaFEegvOxiaGN36q2P4zhHPIAkA2YK1AFXgraqv3nIEk4iKSi44g5
	xT0ELPAGRmXa0pBNGYZ0jV3G+R/Z1/++T1IJNQSAxnCDBlmWluZ1r8sAIGQpUQ3U5WMS5yMLkav
	Wvf4dYWnfEigmrnOujY+gMEq2n30Wtyln9M3wKoAdEexjNxSxizp+7wpbqHClpSE1uXvpDDfvBj
	rPI/VUhZuLmKgJwj6kFrHPMqI+z+BRjaHitU0iWGCAR5OtztMs1aQAaYN9fnezzXafkk9ptbyTs
	GLOoSRrL5gyGYow8phPWk9EQUmP7ijTJHLfsRIvf8dccq4zRDv/fYohA3NRhclE5SDV96KVY7Zp
	gQQfiU79YuVUuphmhoH+yFIXlGQX8i3KBBvvf/WGOojYGB4HzOlyTHc4zOeHTK8xjjsePIBEZuj
	VLEToscWlq7uSpuqUleySDGfP+MaojB75BW0vW8ulIYa5Y33+UwWINPTfNRnVpurjfVssQuSifI
	q8CKUOdPmXoIgWc4WcDfZ+Fx/jIGTCeddqK9wYfuw2OMqtlFqMKLpbCLQVv5b4be2OeKtnDqXq8
	NMLBWde9oApjvIX0dPnaJjqxiLeNkM3Iba8Ex5E8bI+v7wQ77pj5GN1xZntORxk=
X-Received: by 2002:a17:90b:1a85:b0:3a7:d9bc:d204 with SMTP id 98e67ed59e1d1-3ae403dd709mr3918191a91.17.1793201032676;
        Wed, 28 Oct 2026 08:23:52 -0700 (PDT)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdac68402a1sm3415834a12.1.2026.10.28.08.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:23:48 -0700 (PDT)
Message-ID: <a59c982d-67f2-4e86-a110-ac7c1e0f1a6f@gmail.com>
Date: Wed, 28 Oct 2026 08:23:44 -0700
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
Subject: Re: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Nabige Aala <nabige.aala@oss.qualcomm.com>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
 <76e97352-3a54-40de-8ef0-eef0ca27ca73@oss.qualcomm.com>
 <830ef909-d0d9-4f4f-8b73-0fc0cb7b46eb@gmail.com>
 <80fad9c9-4a90-447e-96cb-b1fb0ed98a36@oss.qualcomm.com>
Content-Language: en-US
From: Burke Cates <burke.cates@gmail.com>
In-Reply-To: <80fad9c9-4a90-447e-96cb-b1fb0ed98a36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2026 05:22, Konrad Dybcio wrote:
> Is this something you've also seen with your local changes?

yes, but only one data point. I'll roll back to to that later and collect some more data. Anything you want to see?
