Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1053C4B44D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658970; cv=none; b=CgCXweOxXa9CROOkU+FTtw8U8PPEp4WK6b8M7Fq99+O2m+/u8VYB+lz97m28mJZelui2Tw4fK12b6/lN2TWt8fY35EUzadLyLeqwdzFU2IfQT7Z1PQR5VbXlcrYNXyZcPpUdrk1TlgPZnLb90nhV0Rl+i/A0NWs5R22e1QrUAEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658970; c=relaxed/simple;
	bh=TlMRqQ6L0+W+LjZ003OtT0C1xwK4kdjOBRFHg4mzq5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxc6qCuUH02QpyQAYX+xXQplDtpcAYQJUf2oS4oj7JYxsvWBz/jmyLT0dzJTRY7TJglTJ+/2K2GHr+oAg4xh1wSSk4x5eZoNqMxiiegicaZ88A/oOJsmE3P1jYRarzLjq/PyCOVd+Hsq3cqOBsGYrfz8+9Zet7y+95hXo+F4jJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okrG+hUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPY2Gki1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okrG+hUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPY2Gki1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj3on2777302
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hk36GFpcKUAtTar/b083caQq
	YINIKpMqKrsbZbYUlBk=; b=okrG+hUEVUELGSxU2Q7Gy0F0NIDgLQdkasDpPTPv
	/5PrsfZv/no8tWk5cA81d56Ckf4IbRnjg+JBwaoOh3O+F6y/mqo5KfTIy/kNx/WN
	nUPfkg/cYuaZCQdbwrEdX/6Rc9/stSWbyrGgRC1ISGIvVgYmNlMLdWLUrkSYDZ3j
	eucRk4qbpco0a4yP9IYtDVMfcV9RpS35k8kDsTsnjdcdUGQHp9LU0Zn0KQifjvbj
	gS1zx9+IKGpbZY4H07Q3qdKaO/nsYdQz7pOIw04TZSv/Y4MM1jBgrXet/aBs14wC
	rgKjZL7TLostWY87EuGbPRj8/AV/9oIlshc3blyAkcE9Vw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m38mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:29:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso219749985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658959; x=1790263759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=;
        b=gPY2Gki1IqwIN7lJcbyQFuHOHZDMJDzjXH0gao01KFLnoxzcdn+uItHbkEB1AzpjLE
         HH64NQKX5fi5kWRA7Ao/QqDKl53OhrWKodN/Z2azWtuXiJWhF2jyihXjSw/XJoVGdTFG
         nq3RVptG9CLlYIN1iVXxWIuo0SJBG+nDzIv1bm00pBFvIkw51UfX5lHAC2UYrWLGR0YO
         uxemFZntJqk1a2lAlxOC4cvnoLgbyBqCjbPjH+bKixf27spj0pgJzubEww7wfPjGIoW4
         ZteSBxbYwo5q1kmKGrNxXxteyuRimbL+utu80Upi0n9/I51PgB86NY29TNFKWv6oWGBN
         QTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658959; x=1790263759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=;
        b=UxqRHe+nEPsEpSbi7hpCMTWJvNTfTA1++jTI8W9pFh8WdVPPkkCEXYHQZ6AY3SMfIx
         1UZAP2z6qgli43djdREbQxp618CqoBamcfsyObvKos2oGlCg+Uwj1QKo4ifHOln3dm/v
         fpuxCrV0SE1pEUUQaXUtLDaIfeP+W+2Elpsza/OoFlrWERq7bKyq4SRTEc9dZaVYBxbT
         4gtUayzVjR7jr18ZqkHi+gQ71iCBUxOK5VWLbx8kbLSPJIsP0DTu5Oe+QnzMzv+JrtXA
         wc+VDTKch3MQIiHivNAbjem6zyTV3zRWdaQBa5fUyFztL+sA9zCCUEE2+wgW/hvqkTaS
         5HoQ==
X-Forwarded-Encrypted: i=1; AKwUvBySde8+2w+4XzO9WXswhiDiT3Ovy0gZeoeCvDtDKbdSlS3lT6jz5G9iJPMoIYQQCL1I+rfHUMwISJLFB8KA@vger.kernel.org
X-Gm-Message-State: AFuF++m7rGExSx4GRCvWutbxWQPTl9U1C0a8ZivybCIUxFJOxDShW811
	yumWTGp/AmEvTdjx4A9aNl4ctK3ANUhK4s4HutR62d7jhzeq/GMSBwUc0nhRsNXZwJM2bx8PBZm
	lQutP3ATVsHE1EVXEU+kWTvwmbuOp0oLGj/w6iVpGJwkPfUSdeKjfGTTY7csZg6geUqC6
X-Gm-Gg: AYBFou3YIs5SuLELfWtRCoWteoEmTuTIAewnsfCsw2WwmHxrylklHN8ZPyXx+iAy7Su
	isEP1rz+d4qQqASP9771GY+NgFEAxtYYJDGzHba1MSM7vm1cqHd4t8qx7Hjykwpxf74PnEuT50w
	tMkXSLQrZYo2J2h7DW6UULCZ0960V54euTtmbGZNZMluazZVqrfzmke9I1fieXjBNvF5wOyTtx+
	WY4Ld5rKEjjjmSTc6R4TLOczINEqvH5K4CUN08K6ENlaCr7qVpJ4RtDwnWrg0I+IqaAXnoxADdk
	3NydsEH+IiIFHLXf6/qktquB34bNdSP5nk5SsPVGi5lIONOJ0uuieyHunouqqPlCcl9NnWs01YQ
	GXqCrG8dDJG4Kgg==
X-Received: by 2002:a05:620a:4592:b0:939:31b5:4e08 with SMTP id af79cd13be357-93bb7267e92mr1277599985a.0.1789658958644;
        Thu, 17 Sep 2026 08:29:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:939:31b5:4e08 with SMTP id af79cd13be357-93bb7267e92mr1277595185a.0.1789658958112;
        Thu, 17 Sep 2026 08:29:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbefe1791sm68837795e9.1.2026.09.17.08.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:29:17 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:29:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
Message-ID: <z4usj632ovj2cadfgp2zvwue6vuvqhifzgjb2uvfikitxksdvk@4k7xnyojsa7e>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aac074f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vVi5GgTfNSfdL8F1TpQgkfPHv5ZoSFv-
X-Proofpoint-ORIG-GUID: vVi5GgTfNSfdL8F1TpQgkfPHv5ZoSFv-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX3rm4NUTwQ3vS
 dOJvxDiDF0gQIDnvezqKUtrv2hhUsWl6LEvBtPkO5A6xjHum+K4/CzTeUxGtq1xFsxDHMkn3NDr
 +71YZETrFCUVAaqEjHmUhA0ufuqqLgmAlik/XHDj1PSXlE2BpyqdRFbH3WWeVoWCZl5bqHha9eO
 x/UwQB3PLI7u6RoRT5n0nw3Ib9Q0/Bz6B+rPp8WM0Wk5Q2TRzxMvUtSrNdirrYF6Ddyjt/COlQ1
 LWssshAZrAqhVoO3/8vIvGlAcu3oGI/V+DkKVcXwWeB1CVJqjRnV9EusBXHDgP4oVGUjcL6LY+n
 Sqt7SApxh5Dg3JOG74+dCtZd8AXnFCKzYbTeleXlsmGUJaXcJcNmcaA7dZMSuhnMBNW14TJz/k0
 Ml48MDLJC3IqAcXC67oIYpJmfOw1kfhEsl5LBPBihFxeygdglfFpavd5VFidbEgS5GHl0rjIC+u
 74a2/JN2rb6Ygs1KpAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfXzDWEIG1h659l
 Tfh9zz9r7IKmJdqrMLc29Dfc/q6tuLCko7yWdFN+DNFVT4PZov+Y8QnylChrbVYjDuGI/LWKtPG
 XNXZx1bc4PgXhbaiekOG4hS07LbB6Hg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170220

On 26-09-17 17:11:03, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
