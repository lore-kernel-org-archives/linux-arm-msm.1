Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2AB3D812D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383691; cv=none; b=esnRnGfKItbAw9opJYnTfaBdC67mOvohcB5pEO0BRNd9DZZxmk0UZNvTdY8E5HBmHruk/9cbvJAVx23V9iQRADtLhtvZOqjuHZis0eFe5jEtazsbmmdqqYqB5dp0HBsmIYz8IyBnHAkjOWFEJd5/4HfpXKatZJz0eulyEf2prLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383691; c=relaxed/simple;
	bh=NqPCmk4Z54CGp183Dy5ykZwaZOrEpc71vqW5Cm11q9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzaaJB5rk/JYnSe6I+dqEqp07y7DYb6AiTBmjLpevj8S6D73jKANyUjxkIqJncHYIzZ1pmO17PTeVlqk4seN+4tQGZPtt1UGzO5XQyNw/zhfFK1KdaAl8yNthgOpgy2lEFDHKYyvAXavm1z2+/gvhOYq61ceJb2Hw3wXVWLA6V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASrX1lgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3tJ1F70; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASrX1lgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3tJ1F70"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8DI530979
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pInAVHMlf/Eve6upG1Qt9AIC7c+11ZMyUtGAROpIvvI=; b=ASrX1lgCvhQIVIvO
	1EG760KUa7qJodiqESefAiJoWTwkFlGbr74Q8ShN9j3PL446Ml5p97Gcs4ss1BwS
	QeVC/LI6fNBy1rKgSvNmNuwTt6eRDZBvKhHYsk2vuz/RbsKNMSn5Zc0WrflUfJ4p
	Zi2g57bvCtQM+Go/fyMSBFu06T8qUI2545mhi8Tp2EAWNP9u7vj9l7O5OE0/npve
	y9tqDbOxa4lsl8BIsJJKmQwyH/F1qGsCZ8iV7j0bpcSvOgOjwdCvcrDcQKJJCLhl
	B0dhUtHq1uMzb4MoJGoDQO6i4TQiYRDGdi1mzniqlgHr8blWOaFeVF8b2yzCq6S6
	KIxBIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst425-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so52343385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383682; x=1789988482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pInAVHMlf/Eve6upG1Qt9AIC7c+11ZMyUtGAROpIvvI=;
        b=V3tJ1F70PejshscYpC6BsBxp3/28QtZrXcjDIvxGsnjLUTCvIFo4tsrbyjXMCYT6LC
         r5Mq0xxMol4cjWozN2DJKTP+QpJpXMieCJIKbjCWbPDI7n5nBNIGIBiEERsUvcdtfxOD
         9oZTlHiYk299vVGy7nfAtAB1e2balRVfE9FepNcLloH81dv1k0sqxzWC8QLbtQVj6Ujm
         qCw4mDcBY+914sKeVeVY3VsxbCrlKs2cwaZ47SuVskEdiLKHC408pCjid6TTfxhUUZMN
         q2fIb4kRKWtbj4aJsfpEnHMdB1FND/nyjGNdIFIQQEXxhtOoI+4hT/oHbX5IzIpIe4Pn
         TmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383682; x=1789988482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pInAVHMlf/Eve6upG1Qt9AIC7c+11ZMyUtGAROpIvvI=;
        b=pdkY+4jLLP+2OBV+JS4MBWANBDOSqMdVVhUUPhQukah2rMukQeGCsCYCITrqRtvKP8
         9jfLf1ergFOp3+a32JIgwIhWIET2WyS5KHSGfN+JqvZzYvH3pfJbOdNUYkhRyoCSQuAF
         /SYJVQFGg4MRI6T/yrTFnjNUdNqa0H46rLjaUqhegAS5JzjBk4dOhs1B9HqVdJbeE+p9
         HWcdJXGw3zwd8Wwo3DZGbs7da/S4f0dv5DYxh1OVsr9LE521oB564/3s33yb834L9UIz
         N9j8WO3fklZ4Tfx5I3ts+prySpXV3ya4F0hhtUa1r47Wyg1yVfsWLNiNt8nbD4DIXOdg
         Qyuw==
X-Gm-Message-State: AFuF++mNMIvrb+qgbEDfRBkcT61BcHRsrTork/+bhpqvDIx1mQME5NAo
	1nImAJCWm+YMHfSev6SBhu/EtMCLqkURvQ8COPgziMFPouLubF98mlEXuT5fz6rRZkxsbzSgz/c
	mqm9tvgswcP1TwDq/lou3RXjSQgyHTU8xwKOEfC3QKM7Hu7o2ysb2GG3eeqSXdXHLMlae
X-Gm-Gg: AYBFou3lGuqOIKlBOHsL4in8rvlSSuMqNDfVwSV3e6YurmBP5H1A3usyOigXdLsNKiV
	3e5bKtwAMGs00JWebyvKBquNPvNddU0Ph//vddGq3cVYK7/+XD7ORtxYPrAFV3v6GjURAZVyOAv
	OyPqqsSbeqkeRnPQgX3lMQva3C1cPd/hUvQAvUzD9nHajIwGWOlXIhevRfBKrm76iJBt5yvlt/s
	ET2HQ1TZFGPbmZbSUEg9VwjBbI9JMxmtY5lY0uDrBRMtn5dHZizXy7qrApPZQqM2BlSEqel3i8B
	IOInlqCHEcA0hgOb1AcWABBzuIt/MvD7WxflqNOYDAIqjwRauEUGNp0MgdmIAio8bGONKTNI3Yd
	ZBrz7cT+9GGWEh19Pwa4AkQ==
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr216539585a.6.1789383661436;
        Mon, 14 Sep 2026 04:01:01 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr216340985a.6.1789383649101;
        Mon, 14 Sep 2026 04:00:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966063a2asm405283366b.27.2026.09.14.04.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:00:48 -0700 (PDT)
Message-ID: <72b187a4-fa20-4bcf-86c8-55475643db4d@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/34] arm64: dts: qcom: qcs8550-rb5gen2: Move PCIe phy
 and GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-10-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-10-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXxZrYETnXpeGe
 /geOFQpwgvzXvFz8/bSUMyzujsGIGODtglTWAKTFfdkpbUG6wtl1VjSe6KKBKawGWRT9sdqst1Y
 UZxF8WJZusiqhV2DLJXoDUaR4BOrCjxVfA42omKlu81/Bi9VhkKJ+iKMo2tfTUAgN6XFh9lH+Hc
 5dz03C7YnaCK1u9/fCTnxrOGp5/GvuVlXXL/dRXZTegGp7V0e0n0TG75i9Sb3lkwwLV1mrD4z2S
 Hr7d8bu6vKQuh4T3xcUn61fwtnf22mxhdzbVlDxFpUc2iDTB5RRS30JBPan6iR3iHdATrJHUyUP
 TTjAXFocdQkMar8Kp4OPTPpc02h9El43Ur27voPB+i7GbakDeooGmHEWRVWZ61znAsSM9Huc9ag
 lSPRvKu6tQeB0rvUfjoPH5XbKQ2WqoWCQbyiQlUuzK37F3IzW7/62FSEdpluRrxhUHNlWUBIx1f
 8wbZ4zr+3NdPwITdVUQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d402 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pBeMIvr_L55ZrqE9P54A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: s1PfeXRR0fePKurGLu23UgtaAg9SmFga
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX6Poy6YmdhWG7
 SbDU29qdVbunX2HWKmPoiMmjPSiONbYdwY07ArdMC80mepD6PRnQq2jRFp7X3EOVrbRUFvWQHrA
 Yas4XuCu/JfGf+6u1mShQt2quiAjt7k=
X-Proofpoint-ORIG-GUID: s1PfeXRR0fePKurGLu23UgtaAg9SmFga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:28 PM, Krishna Chaitanya Chundru wrote:
> The perst/wake GPIO properties are per root port and belong in the
> root port node, not in the RC controller node. Move perst-gpios/
> wake-gpios from the &pcie0/&pcie1 controller overrides to the
> respective &pcie0_port0/&pcie1_port0 nodes, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

splitting sm8550-renamed from sm8550 is a bit excessive, but anyway:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
