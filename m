Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608113;
	b=CviyiNzMspw6u8vHOCSHPres3SYU7EA6uyUleR0v78bBJnbcekbnAIUM6oGSdmZVtPMj
	 VdHgPCU7b9CX9U9TX0vZ2nqOHgq+4epaOMIFgVauuqDNAS7oNoJRX7L/3HMDIAL+SJMXd
	 +QDuA+dD1UTQQYk10TOt64qiirRfO4Xk3OWfIRqwIR1VYVqSTC4O6UgIGZZKJToxRzRzI
	 X6JlW7ER/ZYbvya6C0FqV6IrVgpgWQbMFW3UCh63GzdLgsX1G4/IRVlPZRCKMIq4RZJ+J
	 a+NTdqd4VUnUvSEGNR4elDI4TdTlk+fnXoPahBWMZWaKUsRY40dm8LTNjiS59n4cwhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608113;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JH0+oBZQMbhzUlbiC8dnWCz5sXtMHNDZ49YbsVl19LY=;
	b=NBgM8PJ0CTo28YDl5R+PYY6S8KVhNbTkfHfxmR4BGl1gZWwSmNvJ7rQRn8MgJC+BQlZr
	 t8yh9tQ4f2p9iOU0nb37rvvEbO1XRTx2ZlxHcg3o6rHeQZWPVnyfo+NhT+k3i+OqmneZs
	 6bc017g3XO5vMw6TVRPzTQoppeYgnj1qI78yqvK49V0VGiIhwpuZHM0ZNs3EXI6UCXZze
	 9nTJLvB9B1MJkVBq/cF0CeT4qXladf74D+IxDX1/O69JUJcsAiqlXxNCZJci1EI5JulMe
	 1T7SPSvo8ej0GJYJ081ByvYFJQPwNWwm/QsyNenTTCINTcOvWm3fTpxekl74vLYYxnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FcCKHBfO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkHEKFaG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD85606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD85606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FcCKHBfO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkHEKFaG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mLWW4131181
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JH0+oBZQMbh
	zUlbiC8dnWCz5sXtMHNDZ49YbsVl19LY=; b=FcCKHBfO6oIC01Z1971CkqMK19f
	b6IwpdYxK7hts14LM5Tu5dXXC2NVJ51/nQGpRwbIppx92GgLV70t/KNHAPxBxkqz
	XvKLto4njmstadffJDtTosoHjPRaQpaXtNBebMb2u7680gPo0KlHtKwbd+oEYR23
	+kKxrqMxChitoG9lbTRbKpu5ws/pij2vd/cGzcwWWFGFYgamxCsYtugjSmXfzW8L
	9AvlnbkZumDPo+m31KsO5KzUAqR9F6KShCZf+R769WdClM1jIAmBXECEWncGRJ8d
	KFJaqRIoUXn2fbXkKKEIdgJCVojR4ScF+1dyaVP/RyY7JUsRkyw7kAiSDdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrqwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:01:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f03a137f6aso50208025ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608111; x=1796212911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JH0+oBZQMbhzUlbiC8dnWCz5sXtMHNDZ49YbsVl19LY=;
        b=bkHEKFaG0ykIpUvTORCKyOWsGdXaMljYg8yfuvaOjiL4hRIr0mp+RN934I+2cSBwUC
         PDM404kvjLEw4kEsCH9kFLNEotlwexNVSl5zuSDK1HCaJnq3eYrGJs0XpiYtaJGhaPuT
         BB4Q/ed5dUqkvdeDShXBlpKAISbOXOVRND+w+xKuRvMOR6AogPir3BhnUpsrhceZENHT
         BO2oE3wJ+Wj1R27auWQnvHHL5xYMNBCeEif42/B4WVSiM8nCw9sq1BhQ2bTRz5nv+pv1
         OcFamE2GU4H6ZgvzYcVPLB+oQSzeztqeJtH/wwX5NIAMAly4W7XpYQf5y1oFnuiyb5vg
         Qn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608111; x=1796212911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JH0+oBZQMbhzUlbiC8dnWCz5sXtMHNDZ49YbsVl19LY=;
        b=uhoSkYYWvkxReK+fdALIs17Ll+N+nOESCokjGeNq69neNyK//kvHixLU0G3UlIivjz
         FshfgTnhq4wsRerMyYj+YzkDhCFbcGsqwlW46Jqq2CHNvZnu9qoNhzh5CewQ4fFHWRji
         7L/DOD7RU6v0y7wC855icIOiSHBCjNfwtHwdKSBlMYRnp54ik443blyRkRrA/GzJ6RLg
         cqMXkl4gkZSny+0buj/lhzdgRt2gAqvF80bvGnHPKdQv78eQPzX3zusNJMLMZHj0Q8oz
         XWBxya7FaLZO47nk0959GqOtlYCmerOq0PqfWv7Wki80KL3cf4YSeFhSb+i9/RM0BPXt
         e8UQ==
X-Forwarded-Encrypted: i=1; AL+hErGqmjB7Hds3e6KgkxscRkTl+2wiq4JxVnyd2YoT3GcnrT2O8udnw+nofHCsUrrMMme2CD+sRGVFdgidYymo@vger.kernel.org
X-Gm-Message-State: APuU4Z+vzU6KMpSE6vggp29R1lNFMudb3CTaJ6K2yjqq8rSn0st3RRku
	wzd9e9jPZuxNlJD42+UKsEpO5YxDtBib92btl4hOKeaWT0m5aM7VhifMc6PIqiIwCT4Ha4TDVt0
	3H8aQ+UO/2o8PLVM9wYuGj586tXHymWH/j2FNh0UTZXMtmeQpcjFpWWtWf6Zj+dcpSj0q
X-Gm-Gg: AZFdTZcomNSUDzJs02YcXZuWsx77NXsnOPy6Z2hKwJkbD/11NecS8FmaJMU2ZLtp+YV
	KXj55sKvJd23YM8gmT658MMCSikI6wojfSt5uDaH0SAW/lwKTP9O526ltiQ35qe1Z7LnlmtLK7U
	/DOJJ66a/yvPUqL1VSu86KvuMKPHpUQd4mH0d5btrpQvxnTIXwy2ZhMTQyZm1Sh2w50Zv68kgKU
	S5Dl4CpseP6q9U2TZdu0hf3IZncxHm21qJixqZhuWABe2HpqkiHWeaiA/xrtMOFVDic/2X0LW8z
	kob+ekKKuMcaEAxuVD6ACc34XSUP1bHdtcx7VBlqOJIbCZd2vxuSNpI79CHiKlia5k76KsXqbBj
	bHKKOX0OwaEOMaCE1o8Un39nCrA7Rh/CDNfCtXbhMSr8OWMW4VEJYFvUkFPe/4/pLPF37ofWzRo
	JGIEdAR/5JEX0SO+8nfB9uHik+hSzYwJLHurfl9eAW2yQJe3ijyIAAFUs=
X-Received: by 2002:a17:903:4586:b0:2ef:de2a:3bae with SMTP id d9443c01a7336-2f03f170047mr176859745ad.30.1795608110700;
        Wed, 25 Nov 2026 04:01:50 -0800 (PST)
X-Received: by 2002:a17:903:4586:b0:2ef:de2a:3bae with SMTP id d9443c01a7336-2f03f170047mr176859435ad.30.1795608110199;
        Wed, 25 Nov 2026 04:01:50 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a8asm84700455ad.24.2026.11.25.04.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:01:49 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: dt-bindings: Add compatible for Seca UFS Host Controller
Date: Wed, 25 Nov 2026 17:31:41 +0530
Message-ID: <20261125120141.348306-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7401e343-71f9-476c-9143-26d068c28aa7@kernel.org>
References: <61136dcb5cde2c0cfe1b8f3a488e9edcf36043cf.1795517687.git.yadu.mg@oss.qualcomm.com> <7401e343-71f9-476c-9143-26d068c28aa7@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06ce2f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=zTK7sikzi49oAEfBURIA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: aOBYZ79EEKoYeVQKjoj5eeCV0mot4Wtx
X-Proofpoint-ORIG-GUID: aOBYZ79EEKoYeVQKjoj5eeCV0mot4Wtx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfXwm9eiD+1LJ8u
 5J1N4bNLOyUD1IFWy915ELFUog4NYUOwWjcotGEkkaQ7MZHcKcCZ3uuy7k99vIc3hTWN+UCWoF7
 ThuvEMUMPVwXzd1rEewLirkUC5KrkCk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX+JWPTFHhqXE/
 B74pUbuZux0hbpPeMLNg4lR8wZX+5xO+Hs5KU85ltiOzMTgjizkYIwZgeHDFOkcIbJc7XkCLKMh
 u4Nw6cH7qjcDo+we9GgNpKds1DrtiNwMj7nihg0Xw/Sj8D0/iCkJECJZOsR86JWqGqVrtTorRu+
 KidH8qlEDGxa7yvvo9VflNHhqwTgb/nNuEANSbRmxmJ7kc4/fdh3DV8GTRpyNcUUlB85iF3DjvG
 WU+hfNiaqO8FE2+a+tN4LaYrMrUdArhIrx+RWy+nM+1K1I0r1HG3wn+yQtRq+2P7tXJNMFEQbW+
 bNub8lIdy+RYYyLLGlc3SHNI/y32kXS4DIRrtGcIK1AXP2YqggKLjo+lE1VmLVYp5W2DNRXS/KP
 /Y2J8o6Bo5M61CMyFmxVW6VGwJO9px8P/4Uph3x3npXtI5qY/VIoj5UcNJ2O56RjAFgcn/CYJLe
 J0UPb+3zyaZuTHs13qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On 24/11/2026 16:49, Krzysztof Kozlowski wrote:
>> +      - items:
>> +          - const: qcom,secaau-ufshc
>> +          - const: qcom,sa8255p-ufshc
>
> And Claude did not tell you how this is organized? That's one enum.

Ack. It was missed. v2 uses a single enum with the SA8797P entry, and
will recheck the other bindings in the series for the same pattern
before resending.

Yadu
