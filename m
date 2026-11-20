Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178455;
	b=K0MJ+bHPgW0oRwh9+RUqMHnUZA7XSL6lBSeVrbU4IYk0MgAUqq4I81JdIo60LkJGwkT2
	 t5dPCl/7bAMySLb22Omgkih//Wy33quy3DjKlfdZziJtVCypCtt3+fmeJVg6CSDHnzzRS
	 q75OlE7CzzBPFhupyesU9ye1gQcMGrCHnTBr5KXB8ufmo6LDJDGSilGZ/Bqv5cZpNnQLg
	 Lc4O31XhMmTRmxqq0m+lglY/qKw46CyCqMDW2XLLuDKnc8Kwgp9Ogwv64alKzeLgVoT3M
	 APg+HUKD16nVHMgbmCL6zvyvX7NJbzFa98rehnihARtti68JOZrtgBZfD6Wfh5q29LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=;
	b=NlNMf40YiuA4cRXrZ1bFlTLJDb9XDX/eFPIz3ab7rBJ7oykYM9kX8SzvTc9rTb0+00QW
	 7fr5VhzBtKM509n5zCDvDg1mt//0yiEh8VGsVrCSkFcXULUeG3vnFCEnOT2DcyPoQi1ZW
	 c30A6qwyL1ZMVNa+RcqdGMHHEVFVA8ebQC4VSvDrUKCV3hXwV6zN0hZDZctP+0MJKJJNK
	 L/Otwzy21RKYfz9i7+5pv+KR8bYWb9Hke/o4orzrn4SitEf+iqna0tcAC3durCdO9WbOm
	 7WldR3vp4zbjpq6Vvgf4BiozdYUV0u4w/3sLWyFiJmHNcEWKUDHyS84ksDZhQ47HW6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3LWWR8c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQOW1BeR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1360A2609
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E1360A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3LWWR8c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQOW1BeR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkgYH3107631
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=; b=F3LWWR8cu3PlTHc7
	BfuLKFWULnraZ+j+RnzaIxbEMXWguU6M5pZ7p6Gujwg2lMz4cQJ+iPRfILoBaZ14
	F8Ps89wxZC3877ad5we5IR1CqLG5u+ofVvh8JaJKCsyKrAPQo1VEdDO72eZODq7A
	IRqRtNI+d+w6M/tY8RjgBSgUTGFIrfFqpJg54XQmL9VVL1wekFgdY4rQgtBZp9x5
	akB53RPNEb+4uyMubB7e2H+SyveVewXkd2KeHG+YhCQlwt4o3F4rklG3QQ9+ylhk
	dZeM5u4EzgPfo0ua9ts95sF/KHN6vjFwMgI0mZj7ajzV0IUvDD+ytiyYWr8iC69V
	5QfGDw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3qr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:40:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92135a58c91so22352396d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 04:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178453; x=1795783253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=;
        b=cQOW1BeRVDBHZIZOq60fQfgl3aOx374Tb/gAZC4y7sOgA2q9R7RCGMJM6cE+UbHUPb
         5ylKMiP9g7JRcYlNqCGx8a5ev/+Ua0UMxRilI6nUJQAC8jtU2zB+3jIVvP3gd+VtPK7t
         y+bu47GYgy5Uarz/7sSDu7p0WM7StXj9CUQjHODDeBGqduBCIUqw897XoD3kyzOlsKqe
         s887tqfv/Oh4pB/INPSMOcMOg8Kc2DH+dp1vjgaADL7zK0INBsXPjhgRjTZnvkrMR7yY
         QkiXdi+wcU9k47jfS0DSlNTiMPv+7G7iLQaaKdegvR8lcntF4kmC7avsY0tH5oDeC6Kd
         QOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178453; x=1795783253;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=;
        b=OWXq9wYq9aS3MXy8xM8s/iFlm2rg2FBisN+cCzwhdv3A9k2C7rk7zYxfb/XtkmSPpl
         keczNJKjHe62csW+D94Y6fS9YuTIE4nC38TaWOMrSAXiLeh6XR3QeZB30TkOkmBXWILJ
         bFYMjrNZ2N31dQUuVY1CW5To45g8NsrIPn0IrD/j+btCEa4ML12n0JEgeeGa6x4+goZq
         /MABUuhgA0DiKotvr5m1djNI4bVDE9f40L1qHWUPVjq1Jt9e7UfymT7t1XK17YslMTeX
         7JAbmDYNBOesD7UPw6jj2Nk6S4/xFuZF8jBxyCe3q6okntvNJG/P05hM5oT9TyCvf/1W
         ILoA==
X-Gm-Message-State: APuU4Z8eI60wnpOpud1uiYOuYyEtMBgUxeMGS8/7y9srj/vXYqhqRZOq
	xcSw96OHkZpcq/X2qsBXdxqGSPvV3IsFNOxGeShYP4BxhFN6Q2WWLh3j6wMho9Q12ISJKYnjcbF
	JA06O4G7p8+j3wn2fZXlbDF9O22aZxSoFA59Pm6I/ZdbTGnXCLrwcNjQAXvmW1GJ/NnMT
X-Gm-Gg: AYBFou0GxLwqj9hwxqq90IQYiSOGBOxUOForcAl0gTZSiKS6sWYbSM59z/Qg1ZvuqH1
	9MA1A2BqaLFndCJrgAtrdVQflFvNO3kZw+boqEnG13oNeOWpD5OhBQnB2bcX8iL6PkHDsVxtpPk
	jMr1ftxdlqU9RyHG5zVYYpGMHIVsfzzr9qEkxAVkAY6NUP6uKnUUxXw1h/w6W3dECNOLFurQcwx
	jU0QrVTWy/oeCd4lyN7ouUvOXygIEv3OYlWjbwghw3zWyp3qN/SGdIod2m07i2/xnk4I8ooXROV
	ut5GUqRU7osT/u4I6xSL07Y7TDgQS5FemasczRCd12Hr/x+r1JjyZtltWHOwV2eycjgd9eaKNwx
	CgDkxIbANSJt+rGzC6uICMMCjB0ELjcnJI/T24YDl3EWfAuWttR1ZIg5QDaZbPi00PhNG9JFYud
	g=
X-Received: by 2002:a05:620a:444f:b0:947:8344:17a7 with SMTP id af79cd13be357-949ba827c5fmr440601385a.11.1795178453156;
        Fri, 20 Nov 2026 04:40:53 -0800 (PST)
X-Received: by 2002:a05:620a:444f:b0:947:8344:17a7 with SMTP id af79cd13be357-949ba827c5fmr440596985a.11.1795178452661;
        Fri, 20 Nov 2026 04:40:52 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm4234481f8f.35.2026.11.20.04.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:40:51 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        "Ivan T. Ivanov" <iivanov@mm-sol.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied
Date: Fri, 20 Nov 2026 13:40:47 +0100
Message-ID: <179517844380.14049.7516898628067992811.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-qcom-spmi-gpio-cache-sync-v1-1-190440d0ef3e@oss.qualcomm.com>
References: <20261110-qcom-spmi-gpio-cache-sync-v1-1-190440d0ef3e@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX0rrhgS9UpzCq
 nMb2+9RAe3D7h1ppKcoNFXtucx2/I5wi+ypap3+SI89IPNiskVkPFp5HJTzMzHQhk1TuwDSBewA
 Y7xHWZgQCtwpID5S+opwkO0qQppmzAkwGnc9Fxb5BV8GxNWftzObthx0gElkqSlxLLrrrE0U/yI
 pcWlx0VLKJCui4lRAISA3QykhX4I+dPuemb4GmQQmLyHztp3tQFf6k82sCANauMZcKZSlkw35rn
 N1NDOq5XA2R/uFrkYGD9DustIgaZJvWczRsiWUMD2O73qK6aGmsBy25hh2Dvn/OrOOMWdLgMdDy
 DsbhraCM18N+VSV0e/dRtYOeq5g3oAon3iEo4INaqv5gQ9bTQ6DbUs9uFGAbDS4MmkfuJ/ivsqq
 1xEIs4YxFA3DwOwLXuLwti973g3OeGte158HepJLVozOJZDjYvdSt7+41yXm6eTcopW+nJI1tLB
 B0PiytHixDjIECovqhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXyPKMV3XfdO/Y
 xZFnij1Oljm0Jt+EzC+vUYDP23usJwCq9SSSnbsQ7v17Yws19qzFNc4Gum2UdgHmS4gidQMP+ZK
 YwbkOm0Zf3tXFn6CJ6OcuOa+VVhnXUo=
X-Proofpoint-ORIG-GUID: OUQUZedWOiEZI56a6Q1mt36hdc4xooiT
X-Proofpoint-GUID: OUQUZedWOiEZI56a6Q1mt36hdc4xooiT
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b003fd5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HdM17cJtqKwICtWzaswA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050


On Tue, 10 Nov 2026 16:14:19 +0100, Bartosz Golaszewski wrote:
> pmic_gpio_config_set() modifies the in-memory settings cache before
> performing any register writes. If any of the calls to pmic_gpio_write()
> fails, the modifications are never reverted and the real state diverges
> from what linux stores in memory.
> 
> Work on a local copy of the relevant pad and only modify the cache after
> all writes succeeded.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied
      https://git.kernel.org/brgl/c/21d7ff7d6531b3420727539f04470ddae499592b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
