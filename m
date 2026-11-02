Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612770;
	b=hFWsjG/XiHwXJSSYFGdmgd9j2TCrXrs4REjFR50kLYuMJHqQK1zeWhv26/PUZbdprE1n
	 YddOHYAXfcKzQiT9WHHsg/Knr0wNzVU+RDQCx02BLoBS8giFP9uHEloQAJfP3ur+8bDei
	 NvEKDAz3IOY/ocMgNLv6SlgDXSpSQCuRzm0HcDxRS2FmXBJ8kr69+x1lTEHU7kIHfjYju
	 I/mk+VSCiZkb55VwdxJKfLWaj9x//Gd2WDVwpsueYk95gX5bFQgRlVTOPqMzj5bXd7nUQ
	 m1tRYx9huES25phoaIT/rtoSJ47/JRbLQvO+Rmi2RFGeHO+VArKr/bQspfRpLaEqJUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=;
	b=bU3ykR9s99nXK2VBGqGjm/iNBSWfoK9HEnYnwXZWwIM/wdYAFvs/Wg1rAiChJKARrnei
	 6Mvp0cQ4dafMlgnxjZtx7ZoZ2gxJgoUzuYurgcaXJC0fghNqQBNinH+omPwFIResMl1Pd
	 4O9uURUWjnCBPxVwiZfGIt8NZBlqdQWZwkm3TUvxFvEYmxNdHwKypauSXNa9qaMQ2sEt6
	 twQrV4tAWvGMC3zLvEKZHOBo9TpfEGoh0HIatTZZJFQhTS1FJOnjnGKU7YS9oU7TlyKE4
	 2ij3aeVq8U5I9MMA/lPVemX4p5Es89/uIaXnMv4hPNZ+P9g1l8cFYbzKhFDM8i4V4Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owDRMdGu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NX+6oWsq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9555E606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9555E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owDRMdGu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NX+6oWsq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ATGC2361264
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=; b=owDRMdGu2X00wq66
	OscTnQEr4bqM26fXQ7MQ6rYmVf/omdZil/bIaRuei0bUh0bFszq4NJeOAu85Hb82
	7wn7iv6k0lCOrK9+nHdE1n+5YOZ4K14ypx07jdCV2UWixMgxK7O/cV1U9ZAHR+9d
	L7oT/C6Wx7C7JTL4caXqyPIOzo6+ezqm+O7tQGUPzTxyGFOr77DVQZo6qw4dONFA
	0MiL/5FqIXTOahivqPZVTEowxODd0/FYd+et7HKMHJKpf2egqvZbvB4rNPT+J3rZ
	Y/HddhsdxuvgxcLIXyUrYVyB5jb8sPSsCXTZUYeOr1P2uyof3kZYIQFVKJTeaFPh
	VkKbEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7x7q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:46:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso626101385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612768; x=1794217568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=;
        b=NX+6oWsqBamgutEU5FNd2oC7W+b+m7KGaGXqGvAvpYfIZuMNhXOv/raDfB9pCE1Obk
         Wmvgqj4gRo751NkHv7iedPS8WkdSFDHAtnVO3C5v6R2mnrGFUq3eLWzyZVOPejMkf0Wf
         PgDfLYaJ+x2MOFQKfCoK5thuylvB7OiBHn1zaHKYFBAOQ/ALXqqAtKPweeDhBG3vkx8W
         0KUXOaboowSMxhPG3Qi31AjS/G5k+Zd2c/NqDWYSr4owXLp0VqRaPimLKB4AV8PK0kEE
         yKt70XnZ2+5HhB6Uxc/9PBCEVlDHIHb04rFQ6vhloObJRnQ8KbB1/ADfbgcuk77MdTaA
         xRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612768; x=1794217568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=;
        b=1Qw8LCTu6bCpyrKjwA3UBv3VxzNiGhTAkFUUX/BbqYAeNU1MwRIHCr4D4zhUsfdpxU
         +FMLMGKQeCu/gJ3Ber0HAZtpX/SSfEjYXEx9Pte99UL1fLYfRpxloSNXCND7PmOieHZJ
         SFi7cG0K90y5vXamIx4k0KWiHjrKRShB7L5a1qCWOzgAQ4jOa17Uoa1nZFBdLBw5t6FZ
         ggSzdB0vj/XwqQEMxFV63PRpzieZgRoT/FtoYUKGlt5+ah+o05T67IjJT2/tfXTQqivk
         YglD/J2CbxzVmvqUbXSpdFz6sdL7twr6mwVXqbPpCEgE+HNjajP4PBhl1qLAPrV96jfs
         x3DA==
X-Forwarded-Encrypted: i=1; AKwUvBxXcJVimU4pVUGn3aJ7HPXsVK9cdwE//TngV+0u89Me6/JL4N23/3O+hEMZqghUVuY629RaHdtYSz0kg5MV@vger.kernel.org
X-Gm-Message-State: AFq9FYJn1kNodYMqAyRDn84RNJDxrZuw+d23vPs3ukUMdXUIXPOWh2Jo
	dtm0Er8WihBQ3bvmM4gwBDKNh2Wtwcf9Jni8ePmCsLYfxqiCeishYRKpj1Buntg25TsGZEZcC71
	qK1bANAbSBwR3/qGVJW2BiCCta6U3pgGoAE0+9USoiivKuo/s3I8C8OONjkmGGNgTXrFh
X-Gm-Gg: AYBFou1je5fpKbSmKvRj70vmAYAk/LwTjQL87PZFyv0mIPrem/sf+JyaMv553Ue9Or9
	xYnxjOHY6DmibBdvjQoV+DdvTv6y5nomkeTrwB2pCyCCF91hErw4sfXjO0/P4wZyUUE3oyhi7G6
	Fhw/5wuVTlH+bk4c2+V9yFuLyeDUfgAVBh89IJYz2Hg3Yf57sBChoO+rqBKp6jvK3Eu4Nvdbtuk
	jSXBfC0vpuRPnFITyVDfq68guXRibE7BIPS+7uOoKER8CACwLQt04vmGhcrR1fj+45yWXhGFxuE
	NgLkOZNYbvf4Ud6VRg3YBRF8iLDx8o5h+wqdFNmfv8PULt+IjG+uEM6UDQq62P+nB03rYox0Kvd
	mM3nDIxlFnTXbOJBHJfiOhDU32j5+8GtQ3ZDHfZ2qfIEdfe7XdxiehiHun8EC2dSUMLNDPMuT/n
	PT
X-Received: by 2002:a05:620a:8007:b0:93e:9792:fd47 with SMTP id af79cd13be357-94421585e39mr1365608585a.4.1793612767739;
        Mon, 02 Nov 2026 01:46:07 -0800 (PST)
X-Received: by 2002:a05:620a:8007:b0:93e:9792:fd47 with SMTP id af79cd13be357-94421585e39mr1365607085a.4.1793612767277;
        Mon, 02 Nov 2026 01:46:07 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm376852435e9.11.2026.11.02.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:46:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] gpio: shared-proxy: Fix line accounting
Date: Mon,  2 Nov 2026 10:46:04 +0100
Message-ID: <179361268795.50408.17291730393794420636.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: PlU4e06qEExDMhG77zShiP1-MhrMq6rW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXx0V7VZsaxxii
 nZbM3UzSbIiUtvgs85J8+zAnC5mHTVTaams8tIRxcIk0OpxzHmkkF6ta6La90Ny25C9VSLXrrbQ
 4ZvmmA11vBbaIdKLDOXYTi9SLdCTvrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX6XUfPHOF1KsI
 D7Wx6ATeo7rRys6HbxRF6dAaZ32qZAzrv6MXnJ0+YpVLEi7SYUL1yx/PqarnuWzxUt9MQXK2AUc
 gV3hNRdxijgL0y9GOlZxPNZxUaVvu32sGvjNrgvSA0LMFTuZktdmBnsYM1g5xtWtWr8b1oKvtmH
 w/fj2sm6rMcIl+TFwkKEwGtDNMLiZRZesZ31sq0O5VRRUF9Y7iIlNQVo3+IHrt3V9bM1V+uZHah
 lSSvTHPJ2fNx3wUFFEFcKZdkbHwKGX7ImaI4Y6aXOnBp6vcj5wH6WIAqBAixZ/uxOuFUWXTJP23
 4R3nrQVZYU/5RIRkJ+J5hQjXIOcxHYz4dBznV+JjGWM6ERcJbZnX6EtEPxaYlzAb6PpAtK2cZj3
 j6ZkfI5GPZ1Vy8E7ff7LRZh7VuCDHbBg/c/jLbVfFxSghGC5vidjov0XFnsCU9HhKxOvjrXn1XS
 dAzFdcNQ06jggtaaDKg==
X-Proofpoint-GUID: PlU4e06qEExDMhG77zShiP1-MhrMq6rW
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae85be0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=94EpPfmSQ0WW5oeumFEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038


On Wed, 28 Oct 2026 20:34:44 +0800, Shawn Guo wrote:
> Four fixes for how the shared GPIO proxy accounts for users and
> votes.
> 
> Patch 1 fixes a race between consumers that request a shared line
> concurrently. Each of them sees usecnt > 1, assumes another user has
> already configured the line, and fails with -EPERM. On Nord RRD this
> intermittently leaves both DAC supply regulators without their enable
> GPIO.
> 
> [...]

Applied, thanks!

[1/4] gpio: shared-proxy: Fix race between concurrent first users
      https://git.kernel.org/brgl/c/eb70d2419e79b6720fd465b905a2dddd751f2a48
[2/4] gpio: shared-proxy: Drop the vote of a released proxy on write failure
      https://git.kernel.org/brgl/c/53b7b1201964f6f147fa0fa2f61194403a65cdf0
[3/4] gpio: shared-proxy: Drive the default value when no votes are cast
      https://git.kernel.org/brgl/c/0bc45604403176722e634e670f5e38de0aa42a9b
[4/4] gpio: shared-proxy: Drop the vote when switching to input
      https://git.kernel.org/brgl/c/925409db963dbae4628d522bc6b14985e749c08b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
