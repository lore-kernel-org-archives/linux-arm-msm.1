Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30E63F54C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 06:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417231; cv=none; b=e+qepdHAI7aU5LQK9FMaNgbanpOReTKgCPl2AMxTmyZ0Se6wEmR3SCvvBRwVKr9jPVhliceBO/+VASf7uJkDmRgJA0V2XP/Qx6x42Y00x/f8udhcYUwMJtRPQRuNirc+I+Z/eR0iS4aXZE26zxUP9dIqISHVj1JQHCbhARpkkJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417231; c=relaxed/simple;
	bh=cDGLZdgdLdaWlj4AbPhCwBakiz7olPf9997bhEYEO14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3n67S+RgM9/fuM178wC58vbTHb3xUxxULewuujw93Xe7Wmc5oqffaW9UZd48krRNlOVpJC7+8YThYmN+3R60IE4Y9nlrD+k/aWZu06mCG7b/1cHatMbK4rCp8/jLtfmHgQUgemiUq7QPz9XUkx2fczFfq14RZDhXjoHGgUdrBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ms4Zn4Ra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrRLcqjD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ms4Zn4Ra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrRLcqjD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lUJd2596728
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 06:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fr7cHeYqrI16WQmSdQLJQaBM+npOKUH7CWYOJaeU504=; b=Ms4Zn4RammyQ2I/u
	iWL69q5E75UFIB/stRmu22d6yz5BXjR7sPqxcxIGDfcLyW6Dj6XxTA1xx9ASb48G
	2k1vZluop5rQ5kZfWOBH1wFOdazLf+bv1gm4DJisowPetpYvghJ6XYC+ko0cZEZ9
	3yZ8a1n0fQJzQOSXf3GA+YKDHrOqJQnb5UBVa361ilEqIQOtzr9+9fGLpKXDREOZ
	ksMT9IWYnqWX2yIn9Zm/tWpAE8Se32/ZyqjhDZKY0gL9VtIiVNIaFBXVk5Qkxz/v
	7P5DI4kITzm4qIfWObd+vKv/dXOYAPAzQ5z3QSCTTRoUVNNlTQPN1GnVlN2vi8Pk
	3fP5/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja3w84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:33:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso26891285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 23:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417226; x=1789022026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fr7cHeYqrI16WQmSdQLJQaBM+npOKUH7CWYOJaeU504=;
        b=jrRLcqjDYYpI06Pz6KzOMI6G/T0i4VCeePOCThd0zgrMg/zg+D6XvVz0eRJBxCR5N+
         DtUaqhjnOGgpD/FiZD8ABtxBHt++YnQJxK0Vd+4ykF7qnrDlUjxXvW0zwFswNgSdu+4D
         mIEZ75aAUcPLOyW/icS3Z2RnnheV/xNLx2SfqM5k2OEJ6+4CO0KvjHm1U2AIGSftBGAf
         R4jHOTPSKi8hE0F0LQzGP1c3rMMRI7oTUdRxf40rnXNrFjHw3foqe1aIFJhor0nJ0IqK
         S+Vv7gcOIw4m+dZ1s+WnH0PZ7ag5VzP1mvtnui6uMq36OUgWcLJ4rNuV9FugSrcTPSlx
         nCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417226; x=1789022026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fr7cHeYqrI16WQmSdQLJQaBM+npOKUH7CWYOJaeU504=;
        b=SfqJoq+zUZ3mxNB6DzBdoxqEEqujNE6ZD//tprZ/wdJv0X+IiTxMpTsEeYo34CMAPH
         NiVdBlVW7834q33jF0YqsTAsa2jx+t9G3KoIRVaPMBJ7p675JHeW3epyTrUw0KrJ+x0Z
         /7Ell9uM+hhfPDB6vAZH0pAw+ZxLFMcRUEdZWzBfDJG7ugr40u1hJW9r+c4cbICXw7ZY
         +81waDgAZ86bw+jeenNoNWjoi8H2DPd8teT3VG018Nk2sCapywMJy83ZgI9GiS1gl7Qt
         XL/RMSgwlk6XI903Sfk4c4BlfIhYm/8VGRzaiS7btLzmFVmmJJte7obaWvMr/suliASQ
         reNw==
X-Forwarded-Encrypted: i=1; AKwUvBzaPw+oaC1TrTjxbu2YJDRpncb03hORI3iAgnqKZzaVcSevUPHK5UzMSa6C2mykD2UOmDKOfhifs/ObQ27k@vger.kernel.org
X-Gm-Message-State: AFuF++n96B7R58PddkrBXWfbi6fBQkDsFW6H2lt6EQR78BzSy+u3DO8K
	J7hhE1QAGCM1r32vnHlNpz0o+2cDELrW2KTwslBvzisogizkoROrLZm3G3Jbf6v2utgMWZhLWp1
	NAogAh9wYcgWUh6h2E9l9q82byVlz3F15lvlbyUeD7ZOeQE48mcTvt0rwMxBeZe1JpNnX
X-Gm-Gg: AYBFou1aAlpRbMh3ESkC0T8yO3DmV/cyA3W2f6Ytpx0bt8QQilpnCE5OWXTr1YdqJcu
	ZVEWMUY5K4nYqLQd1Fbgc4vO0D6vu6Huf3szxcxTNpJe/1XF3FmLlT3wMNCsqmqEpfqvD6N3DQd
	C0VYNuET9Vvbh6e4sc4Kj2JU5JPKjpBSJIl42WPi0xCwaQQ3KpzQUMLLyRrIyq1njD0+P6SBl64
	1h5/iF/YC8cSyJPJYpZQ8Y9KuYNGxDU2nxyRsrh19qv/9zckEH//U3g0tcJkNBKvWweFEd+IFPF
	bAdwRoZN+meTy633Iuj9VdWEinRGgyXN/YfXV/WyZ5pHi66HccdsIyQy9ShLhnTd9muou+7ik5G
	P2ZymcdFN7yJy7yKqa+5G/w==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr702105285a.6.1788417223911;
        Wed, 02 Sep 2026 23:33:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr702102885a.6.1788417223371;
        Wed, 02 Sep 2026 23:33:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eeb888sm53439266b.9.2026.09.02.23.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:33:42 -0700 (PDT)
Message-ID: <292a6a67-0870-4735-a34c-50f2cbae36c0@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:33:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260902194041.1999834-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902194041.1999834-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5GyOFV7yqxu_MPFQpmDdkUOSNVl-Fvu8
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a9914cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OkyngIYZ1pMGiDKQ6L4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX/qjtYQ2Y+ggb
 B1Ug+G0DeJ4WSQgHa5HK4z/Jw8a1OBj6ZSFsDBze9XyzozgR6XjfX5tT+e4eVKXADJgozb0Aw02
 +HBff40g8EXv2uTjmjU3hkAsPwL6vac=
X-Proofpoint-ORIG-GUID: 5GyOFV7yqxu_MPFQpmDdkUOSNVl-Fvu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX8M4yoiHcI4Gn
 WY3+IV1km6IaNkqIf5D4xl6K1zAm5PGeMtLbC/HyF+7oZ1waxxIwhcSsgNLW6QYNo6KxWIWjXfw
 PcH7jhFwqG10o3sOhj1dg33rrpTGXY/F/YXO+E6rHv8eQyipu3lCpD38VyFFH789kytnd0qtTJq
 QF5J2HE900xOZT/z2xxcSp2IG5JWy4hNbnTt0BRJoylwt6QS6zuw7Flj9h1mjxkviAE06UYc+Id
 I5B6EYLBoSiXQnPonIs1tQo6q1x9TzT9h0PLrWPM0/5RjlC1z82A8uxS1iFjqR16UNwHjUXkzOA
 BoQJ8/6o11KlVfb+G4TbWyEJeZm6jemi+7K7omICiNphJf0InYtz1ssvFgxjI2iPwWmMhn/u4bV
 8IRJJWzB3wiQ3ft9W4eRtca844ZEzyc6exvDiS8mpkXEPJIL5epj1J2CsdH6R+MLUalJWIS24JX
 PpiXfIK45AGul4Fry1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On 9/2/26 9:40 PM, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
> 
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
