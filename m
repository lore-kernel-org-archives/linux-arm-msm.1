Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2290049CF36
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 08:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944152; cv=none; b=FEYAGI8JeMnx0Y66vFtP4qRnjrpDSlFWxySH4/wqF53MjfoaSwDEhVAB9Oyqjs0VS18NB7xgXPM9rp1vNolL4a2dO5IkLooQQkzYvEDaO5g+umlXqF2FpQy5CCeu8akZqc5bTUH+GvuShKNQB9fmxXpT/3EB/EQFKrVq9mRFX/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944152; c=relaxed/simple;
	bh=ekfTgZTjlFd+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aHMpMSnl4eQkpXRwz7EKz+5ntXNri2R2D7yAnkT6W2a5G4ACcGcl9xQ1oxOCyiOWgKZeZMYQCpYEdf4llQmJX32BgsVXquuLvTtfGtu+W7vQduFB8qbG8jCXf2YNjzc4TfY2TWa4cH9MkaUShqJv4TbgbxGI1VaZvFFtu9hZwUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8HdMo6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfcaeGMN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8HdMo6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfcaeGMN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896MTF0129581
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 08:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ekfTgZTjlFd
	+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=; b=B8HdMo6pPM0FfsNcfA8zJmmRqGb
	kbM4F7xoNOmGXMjMKFTCyqnG6RRkLjF5MjcgR4BD2hvj9+khw1nprsuKVfBCzPEm
	/nglfqdnXrGmhxFntGw0u/kOxJzj8cImy+91NUsyGnq8xZzK3sjKLbf2lwCdgC85
	/ypfr067+Uk8bjZjI+9TvOqikjql5Cnfg/UoBlDOBWaTNjio08hiLS+MKnUXacBz
	VjTaNp2aO/nYOYmuzStR9iE2418uCM3+STfXUcdcKBEa3x5833qpJW/8Rg2jSLxe
	ltWp+GEFlWopLfFqXvdwHsVFaeY7y3GXxAnu4UHZI6kfn3CjueGupOfxe8w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpknhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:55:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-384d033f7f5so1377929a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788944148; x=1789548948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekfTgZTjlFd+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=;
        b=DfcaeGMNBY6z0YtXJx4y1uftIud8zt27liHIbHrjMdnTQjqhn0GQdzt6p1Za+IU4sa
         omf+Zl4ILMyJlKumKrxbhtvTJh5JPhV+cSiHCxVPCZkZQyr1WKWWI6lJfK/rAsI2kne8
         YX5DwBfSjWeHfCgA1uCQYDG6arIAIrNHByTPwHilghiGMUP5k9YVjrHgiqmnwr+8iPRA
         BjasthnRVoSLPSQeawwYl+46DHRDTKyzXDmN7Kp5jMRmCVaazD7JtMogipm++VZ8VlUy
         PzfvSgzkmkM9kRE80/fwDzy79ad0tPb1h8Y9rGwsDj5u2nlPC28VCtJ5HjwXsjUkfA1L
         YcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944148; x=1789548948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekfTgZTjlFd+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=;
        b=qyW6tUoMXQFh/A6u9JFD3RKNWPNR/jw78mvRgotk2cwA8E/ytBt2Uo93BxRKO45jrh
         TWRWWute7F4eOfGzZgQuL6hSN+zDv1xP7zonfNUZpdhDWPmCFmi7ZStIdenTYzINNGFa
         V5amY4ysHKU6PFElyOkzxyc25T9iZA5tBSTYTv5HVrqzl7FE25c2x+o74hhvOSBuQQ3u
         LB7vAqSYsS30d0cX0AqnQArYoUCWTjdp98lhUEsIlmgXNCv2tForq7V2oRjQK0zhk1Jk
         PDJJJ5mys0tSrB28UqPq1hkZhIsjxdiibFZUVj7937Tgvv7uxT9zBJVHOQxRcAtipzbA
         XvfQ==
X-Forwarded-Encrypted: i=1; AKwUvByf0wNmxO2v21+MuIBTX8b2kJwk7jUNPeRT50+c4q/xUg+zwHlzUMDB+QH0yi8KBCi6bQaOifVWrQO3Nne0@vger.kernel.org
X-Gm-Message-State: AFuF++lb0iYjQoS02fs3wd+iah99hwdh2+XZTSIieP4g8a62n0vc3yDk
	kYpcAgSUUELmzY5jN/erIXTFPd8tqDpzPmhI6zEuZ18MNmFiNiXlAkE8budTwfIZOXpzhf7Ak5z
	VLE8KABh6+4KEzG7NOBf2qvvoC69xopfURaBlHmUiPQnE2lb8S3oQ71TvCgQgj6Xr1oYm
X-Gm-Gg: AYBFou14zuAbLf8w0ElhstCdT5y0kr6sjb+AVsJO2plsk993cHiVe1Xtocy49C7ueoR
	Yl6m1GX84Qu+F2dbfmXca02awNEHNspLQ/n8B2iKfItwqKDTCl73UifcsHBxsyyxoQq2L40VjhC
	wj8CS3X2pCmqwPpaiKIWRsOT94OCs1xO2nksoKVCF6u9DqkWuNHwTZfyoQEjH7ZAxfANFb6HtqF
	Buz1DwKBop/jC/3hh5dY1WmPI2/cMnDPgDGjuoX4lZot5FSF4+cUSZfSyyV6GMks0xQVbnY1ovw
	Sgx3vJJvJ7Ab8b+M6oeFd2liCmalGYQ+JGUtG+WD4J+LeTrIxn2Wx0z4c2H1XbhsMjytNbVtJ2e
	mofK6PTx20GSQOtcxLXhLYgk=
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr31740160a91.0.1788944148285;
        Wed, 09 Sep 2026 01:55:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr31740125a91.0.1788944147853;
        Wed, 09 Sep 2026 01:55:47 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1c16sm4496919eec.13.2026.09.09.01.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:55:46 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: Describe the PCIe M.2 Key E connector for Monaco EVK
Date: Wed,  9 Sep 2026 14:25:40 +0530
Message-Id: <20260909085540.185221-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NyBTYWx0ZWRfXx5Q5rjY2pEm6
 JY4C6cby+bMWXXlFE0/9L2LebjgRqF/3ThlGKlsFnCYFqbfESn8PkyZuZd9TWGqHj/m3SyIHnGP
 7VFSK1CrCzzPFw1R3R6yqEm8VtoWr72PTz/mILHTQ2XqP6p6xQFS9SHyD5/nkd59UhIxaTpP8hx
 fRKrg42/LtPhzdONK4rKIy0eZrRAcE7jdPhqo0AcdIAHQcs49p3VSgy9ScIa+LcLOnazuTTcxRx
 0UHQJ3A8rK0lq2ITmc8+kVPhJ3T1w1vAW7xdZ//ED40ytXWha7gQyjoRClXUKFMSLFe0fsoc/24
 +npru295X3/mdQS1iZZv7+s/quxcgosQqxMTt/YZeJF/N/L5tMiXjB/pPoWyp/x0nPTFbHuW4Tb
 b5Af2RME0z+2Xt7S3xlkTdwAVS56yxxEWzvz+tcbM0oIPoC+LGshGqQKmpmi08SmVo15164sEpj
 5sYXifxYw6oapNAWrnQ==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa11f15 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=_XwftgCmqnCmiCopI18A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 6h8xFPoxCeXCXKDZ19HDXrzLA3ZldAs1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NyBTYWx0ZWRfX4c8jkZlfQdDQ
 TJK2va8NlJUSK49/FKz9oYBKSBnq0HotxK+AMfdLyxD+FQNqc2OycjBdWlsRXOF8UpcFX1Xu4Dv
 /KuD1X0Y/p0PXQP0tJCuNOa+otRAjBQ=
X-Proofpoint-GUID: 6h8xFPoxCeXCXKDZ19HDXrzLA3ZldAs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090097

Hi Konrad,

On Wed, 19 Aug 2026 19:27:31 +0530, Wei Deng wrote:
> Patch 4/4 moves the graph port/endpoint anchors from monaco.dtsi to
> monaco-evk.dts. This ensures of_graph_is_present() only returns true
> for boards that have an M.2 Key E connector present, preventing
> unintended pwrseq probe on boards with soldered wireless chips
> (e.g. qcs8300-ride).

I reached out to Manivannan to ask whether it would be acceptable to
change the M.2 detection in hci_qca.c from of_graph_is_present() to
of_graph_get_remote_endpoint(). His reply [1]:

> This means, the dummy port/endpoint node will always be present even
> when the M.2 connector is not used. I don't see a compelling reason
> to do so.
>
> - Mani

Given that feedback, the DTSI anchor approach (which you originally
suggested and reviewed) cannot proceed without the hci_qca.c detection
change, and that change is not something Mani finds compelling.

I'm therefore planning to drop the DTSI anchor patch in v4 and go with
board-file-only port/endpoint nodes. The series would shrink to 3 patches
and no DTSI anchors would be added.

Could you confirm whether this approach is acceptable before I send v4?

[1] https://lore.kernel.org/all/isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24/

--
Best Regards,
Wei Deng
