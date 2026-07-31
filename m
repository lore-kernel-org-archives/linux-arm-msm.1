Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194A33E1231
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486719; cv=none; b=OgfIGaBq844rF+9ahtLDrdV5ZMOml6ElPMo9YuGdFkiE1Zl+lxJf0uma32BS/TSj2ek/BXMLYuwyox7/J5QYBoOyIvRE5m8/y917rV1GFOk/F2rM69fCCMq/q1pJP7JFfC9VU1nXl0vZDgy8ySnKz6H8cM4LGCoC7LfFDPri/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486719; c=relaxed/simple;
	bh=TDkQHceDrQu9o5vaO+QVXAKUr98zldP4VbnNS+KmXXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4DmkjGQBpqKGZObbnkeWv3LZYt8NOm2qk6qiuRTIK6Au5DWrJi3Xp8D79Yiy9DJnWq2JkEz0NE4aQYUYuMlDBiPMpiB8isGXifQ+PZ6O5CziuMVKucJLm8GVGiJDzpcKkRhW4G7uPz+x0xxsKWDDAsbkfOYUwN1iZTGIBLdYLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oB62beYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHICZ7P/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oB62beYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHICZ7P/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8VKWH3285630
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nRcLhnU8RvHMiOpCapizL+8MGiRW3OtTxZzTT0OFe/M=; b=oB62beYz53A6OZRe
	urMY1FE5X2/pLQz9xzb0+fi/EubDPGLHakPTHI+uDCxY7WgtlFFNPQnd8/bxFT+j
	j5MmFwgpn3wiX2mw8W0oMv2lHDEAJcUPm6i6un4z6JOln9+L7rf87xRaIl1n08GW
	yJT4t1g0RnIU25ffm7BXsI484wrgUl0TCKh43rvl3rg0s18jOZjBZeBGtGzskCUH
	JOBm2t8G8YtiTS/0kviQoqETsvvYY+dCEUGriK0BmheMe7G4TMLHQxoFYhc77N54
	MKpXqSOEaYtoKXwlwb7tbEiwtv4UP53oc6q8WAfsGTi/ZN8WaHZ18Dr/isw5G6pG
	OF9mYQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frr92g03c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:31:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ebdfceddcso6619601cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785486716; x=1786091516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nRcLhnU8RvHMiOpCapizL+8MGiRW3OtTxZzTT0OFe/M=;
        b=bHICZ7P//pOkiGFtT9ggqYQNtE7LX+oP7f+vXrKBt0F/IzhLxDaMYbf+l1q9bGOLQg
         x+Z8sK9LGV0VWk/OeIqwS/j4yfSbKOzEMRIKZ+u/zBDcKIOps7HWE79Md2hjZwp18YIq
         k69fKDJxW1cWPyPoT0m5bRc/7TgtfmzkKWDvMwuGjlebVoAHHXANbfLyKo4vzo3VsXLt
         vnjjeYMxB3SII8wCzdp4Wr3NWeEjfAnDNpZKaqTeU/QAk01/fn9J7rUBH97DyBYSLznG
         uWpj3y1Cm4+NEyU915Kn4NmvVOTNVLKyxdRYWItkTc2JfENmHw3gQddN/10sIRKa9jWV
         +RPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486716; x=1786091516;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRcLhnU8RvHMiOpCapizL+8MGiRW3OtTxZzTT0OFe/M=;
        b=L8CVgT9kMd9f0z4YS8nNPgGEo5/vNYd2S+/+P7S8BvtvU8rMtMFKjCuOC4HDlrxkBj
         bCac7I8qvW2yps5P8/eeCk4C3xSnR7KjMBELWuQhyipOU4IDym2pOJ7+E9eUnmX5i+70
         qbSeszS0SPh9cUZ+mUQOt40P4xsIVdiwTBltHO/05Bob7y7vfXhJ/529FhDNvb64Zhcw
         RkrLKHIz7xAzodAq64sVHw/vf53gSRrkffRICho2AVWTkYvskMBqqquzGW5UOe+BZaRq
         tuLikO5BrXb1uIwOukM/BjqZHe+zsnMjTD45PC7d9CM7uuEHPhOsE8bYlj34m4qkyy7c
         H+HA==
X-Forwarded-Encrypted: i=1; AHgh+Rp83ZkiNo/45mVG3edQGFw3JErRkc45WOV+KSlbvfflbiuwUAxPWaq4kgszae4KDTQvqcU/02clQlGVKeMY@vger.kernel.org
X-Gm-Message-State: AOJu0YwzaNrW2nygFodprgZNLq0haShYn/yAoUYjJK7xuo48capJCemt
	oGFoJNS4BNQS06WNZXPQhpgFZM6lxNF//bDPwG3d5tvUfW93an4tANug1Cl7GJiM5apeGyx8GoW
	m1WsNREaxw0Q/+uKbgzu5sbyaWYpo7FLYX+hkLsrLVOD7HPd0pNq4ISkZZunj36r/44mh
X-Gm-Gg: AR+sD100aSvhZCgn6pwRNn8eB010dkfI3Bn3IzGQHicSy50uftIseR3Mm6ZKcBSpWOk
	92Vh/GN9RDw3+ys00jzsry/qTccCLqiN9NBE6KH1yoQgBE0+LYba0PhEqlGzy/dAEjFop7/o/39
	S+prvWyu4eAgvkH63oDZzgjSNv0+pwbEMQfHbx0iW4fuu7ODdv0xx2mX9XG3bcyPwTm3nyWkBYJ
	D9vBv0uE9ue1nm8sPKLuDuARIqlsNbJBZTIrxJJhtXrK3m++zVnHVqxyTVbGcodlvxsSfcR39FF
	/0DSyVNqqaakCQoaZ/6XAhLU2liXt8rRZQClTPViSGQs4/qJhwoM1w8h99bIHHYmnoYEnB5p3me
	6yjw3FbtsHAUmIna0WPGCqRyVw46t
X-Received: by 2002:a05:622a:4d98:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-52b4aeb645bmr13804291cf.7.1785486715967;
        Fri, 31 Jul 2026 01:31:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4d98:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-52b4aeb645bmr13804121cf.7.1785486715593;
        Fri, 31 Jul 2026 01:31:55 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:40fa:e8e6:4785:ce70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4454321sm61184766b.31.2026.07.31.01.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:31:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: shikra: Fix intr_target_width for summary interrupt routing
Date: Fri, 31 Jul 2026 10:31:52 +0200
Message-ID: <178548671021.77694.3475041309715789489.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728-shikra-pinctrl-intr-width-v1-1-46583734d808@oss.qualcomm.com>
References: <20260728-shikra-pinctrl-intr-width-v1-1-46583734d808@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uxCFUD4TN82VyOL1gMr8WUo7e-08CBgM
X-Authority-Analysis: v=2.4 cv=O8sJeh9W c=1 sm=1 tr=0 ts=6a6c5d7c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=z-2MmutFRShFpDa9hlsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MCBTYWx0ZWRfX6Hpi3vo3yF53
 X4fFCa4zlXW8MmKFBuT20sAZT6O96G7rVEUAMv8vA55tuOInLwiNCVehI6LAui4tc6HWoWmjqSR
 PNKvabKzzPM2nmrNBtqNpqlXeDGziZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MCBTYWx0ZWRfX37vuRgkWDwJA
 dTpf6f+zK2OiHJNLWsxqFmYsIeI/pS/Wmq417De/J+Sm8CDKUQhFsKJCkCq/uT5t3D0nQKTMe1c
 WKpsLSjm/AZysVy1G4IVohF9ryUKAS4XxhbLuadopUHcMzjD0bzmshEWq0gfbbFcrzS1ps27n39
 ScTx6cLHoNg6k0Rnr0xUAo4/uskqAhBHs9fu8O4fjmNP0D90Zio7nexDWcyq60G4ooYovlPojJA
 cJZ1hS4hHlZffzA/IJcpj1/HX1TRajhZJok+6tjeqfgj2J11GyAk7F2O01F50uzcgmYd096v2YV
 Bu29T6btr88f1gNiqDxp9pucJ70R2I13fuhG/cvcGODOKSCmSRk4NHB359qwsquWGIRRhnbVpfV
 BPOTYKxOFpKut08jk4RbH+mcX438/HOqIKBz+A7+KUj4LQM528pEvA7AH1t5K2jE+PaOLx/BZjO
 H4KgVjorRmQ52uYkNqg==
X-Proofpoint-GUID: uxCFUD4TN82VyOL1gMr8WUo7e-08CBgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310060


On Tue, 28 Jul 2026 16:33:08 +0530, Komal Bajaj wrote:
> The intr_target_width field sets the mask width used when writing
> target processor into interrupt config register and deciding which
> processor receives summary interrupt for a given GPIO.
> 
> Without it, pinctrl driver defaults to a 3-bit mask. On Shikra, this
> field is 4 bits wide, which could corrupt adjacent bits and mis-route
> interrupts. Set intr_target_width = 4 to match the hardware.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: shikra: Fix intr_target_width for summary interrupt routing
      https://git.kernel.org/brgl/c/1e7b04c12c077e8829991833a9aa2cb3bdacab61

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
