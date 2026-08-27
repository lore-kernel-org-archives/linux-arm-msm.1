Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416E43C1983
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822560; cv=none; b=HbAUKuWW7eSHqTRcKOKJnMwVw+tj1g2bIPCZzV2RbTaQRDQk9gYmtCYz4jcvhPm5mLplcw4LYaP5qbjR94Engo5vKM4SnUSZzmoZVPSZ1C6Os26sCTl36a9OncVPSFH0NhqtE0tWKjCoRTtuHAQ3ZxPOVuK/vXDKC3i/IxMO1kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822560; c=relaxed/simple;
	bh=EFvzre54JxGnezmSd2Zmn1F8pbR7B+VPAVWpl2PZLL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U14kuuJj+PQVZMEMto0AQyfyc8rHcOOziV/eUvs5ZIBQOUPC3KS83aAhDiqzAhv+Enc+151z+4AmVRocRqwM9sT4q8i152855FFVMOFzXdZciejQw+Wk3DhwZQHPi2DoQY2qjVGMFXtdXnpX3R8E5yY9WpIj2KbTNVC86k2knus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDsUonT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNE3yTPd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDsUonT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNE3yTPd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9HG6s3090863
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GRQ622yfIeZ4mbFm4NRuC4KD
	EWeJhchUHxw/jWrkUso=; b=PDsUonT1qZtgzICr9wkFCgKI4C/dgi11f3zhFSzf
	FQ11tvBWhzR3wObvm+UQOepH1GKHHD6D3401nSawWmMFQWlEGJ6+bgxG2hWPwYw4
	A09NbXFrD4SjftVreF3bzkh6T+gkmWcHAqiJUKuy7dMjm6ePmjOqL4C5B6Ihpbgf
	TPvFWhgt0AX/S7p/bNsE4kiuIYQBHuS76vI6EcIxV9Vqq2N5d638P+FcFvwymkNF
	eeV5AQZ9WMhEddH40HcQZKs3U2FipQJhh3pYDBOrRHpNzlZg+WuhzFZ5HkU6FUFQ
	HhTzzramSIjq/oSQskC/Qpo7W9fdkBoj/4ggMfxzv4JfZg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4fwk3tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:22:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso34245006d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 02:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787822557; x=1788427357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GRQ622yfIeZ4mbFm4NRuC4KDEWeJhchUHxw/jWrkUso=;
        b=ZNE3yTPdS1m8CvUYCLeJ0QeoqML8PAOb+octcL7UwOZEdPghLZtNik2a8OBAL+Mn+l
         Gnbiyb9BNQ7QD/5tbr3fBWsfwa5Vu6SkM1ZSNw4rGxqygJay0vm8jdbVmJJRgaFsiCxe
         aN5VDaXHbB1RCF9tOMHeyB2fXbIlpkwblGqLYNvqptAKx8fwgI38usMuTcr+Qja11c3+
         Wr+x1eyS7mgI/l+OL6IfoAk5DxeBOsOZYc1qxJfmjg5RZr1mHr3s5oUOMk4kRNwN3Lwf
         kXmi4VgJyJmCX/E+ElzJwkmPJQboNjjr0LiDTek6oHt2yEarSm87pSty8wyQM1z5Lenn
         hdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822557; x=1788427357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRQ622yfIeZ4mbFm4NRuC4KDEWeJhchUHxw/jWrkUso=;
        b=PbsQFSZVsyLPU59QN+vw9tDBRXQ0Nanl1/g4KDPm880NzQc9lgrTs9pF6K/KO19hMV
         tFoEar5ryTCAjBZjFzDmNLXEg+ABnJ+Agcsg4XiD6uKY9Fk715b3KzNQc/jVkiUXiI0D
         gXOdbij7DfVtmJM7joZvnwdR1UY3ESX9d3cS4aZtF0YN5evDVdcfWJLEcf7DoAufdNL6
         g9Wj66u4/SO7y2G6NHMgObsHNy6U+6e0q9oPGOKd4sGykIG40goqp3mBICDc8g8+jtc8
         qKkA8P/6LTwHzNvWQ+cpSDhacXBm7uNxN0ZZ+IQK8/f9NWlbD5V11sTpccJzDKa6zLhB
         hb0A==
X-Forwarded-Encrypted: i=1; AHgh+RqBcPoyA05sI38+2S18uc05pGqTvUDVOstbjgOhRR1C2GcyhJeuaziikXTScM//SF/6u52PNalY/bLxvXfZ@vger.kernel.org
X-Gm-Message-State: AFuF++m2Few+S69723uUcYs8Qd6CbBKYLq5VFZ/f3RPRG/bVJ4ZZviWp
	hu4qTiESClnPZMDftuAZ+73Xk3yi5BWqlIWznHtGYTEqqpjzkeRhgb2TbqOeouQAZnQ+SLmkMks
	KJXQPOujGY3nFPfSXQlX/Oqz4jLRhMwA4DbEbXA3PpZKs20c3x/Iegn8zHlac9pm3+SD1
X-Gm-Gg: AR+sD13p8TIhQo2V0hHqUzY5atFjFt7FH6PVcaYwL3MjB1mVwDTETWSqJKz7IT/+2BF
	VVyrtDIoFoga0gCSvHl1o3Da/wwu/omFxff4j9kFGVPQRFRD1Azhjt4mu4M2mIxTcaRoWnPafzX
	ya8rSyo69vCNd/EUWKv38MubQrWPsZs/fd1fADh64DUl0YslLfEzk2TNBl+od7Av4l5KXqIa1ry
	q3owAhqSO+OM2wuXFBhXJKQOExUB+8JgJqNKwqcqAYYjMA7hGfA0jjlTliJQfBXucobMdPAl7Ua
	OgFrqGTH26sKy9mk7uxx/5RazB7NsLkvhjvUIenSuuCy/rW4LUS/vnIYGyn/la3sPP/4dZsdqhl
	PVQYTEgv2dVENWQ==
X-Received: by 2002:a05:6214:1d29:b0:8f1:d3ee:a8f5 with SMTP id 6a1803df08f44-90cc794fa6emr133851576d6.26.1787822557449;
        Thu, 27 Aug 2026 02:22:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4815:b0:51c:61a:50fa with SMTP id d75a77b69052e-52e42472cd1mr153279081cf.39.1787822164661;
        Thu, 27 Aug 2026 02:16:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5616f7sm60354455e9.2.2026.08.27.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:16:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 12:16:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@mainlining.org>,
        David Wronek <davidwronek@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150
 into SM6375
Message-ID: <u5ewh6gl367sc4f3x5f7xxyvzf54vznnuevjfztlgqhpjcpp6f@xvn43ih4qxtb>
References: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: VTBWUnSu6Fha-4_kob9ljtboELnuzM77
X-Authority-Analysis: v=2.4 cv=OtZ/DS/t c=1 sm=1 tr=0 ts=6a9001de cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wAkbjeueQAX_hA7IGqgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: VTBWUnSu6Fha-4_kob9ljtboELnuzM77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3NiBTYWx0ZWRfXz1njLVe6WCN9
 AoqHP9gasgNt+YHkReDIe0k1uIjiCuY8yb70vYI9rfnQ8zSeFC5eHfpHRxLZU24RVBDYLX2N8+S
 XBiIRefdanJx3Ja+sihP0qQVu3dtkrwxvavK2A1lulSWNbdFq+QplKjkNw8UOq17GshboTkm1kq
 +jc7L2+a9QWmpND0yBss3VbykX7tgTgyOiL4mz9hkuHnQFn/H3XwXsDGob9xafnUlIo2w/yxn2K
 H/l/ukMgTBRVLuEITpiEwUy5J6HgWFMDgm9Hxcri2sxaw/SpIPr73e/wlDcyFc4H8fkT0cOUa6J
 ZC//8KKbRMDvPCzKt3DAhU/PC4yJL2BIrgl4vOni4PPKuZ081FnHw/q9Lm02daxWFXB1cAehCyx
 VTv01LILsEgSSH978Cvzcm4huPD80cVCrQHd2PKmHq0TWIVkOdIY0He9vB6ncqxK6TbSl/NJ9pu
 0UC4yIG/9QAwNCeTFlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3NiBTYWx0ZWRfX8YshOtO2Ay9P
 F5XizP4Es4oMi6degfrtSvCA+25twQsnjORrHsijJV0k2H4pLHnxA2fUP+PTtzxyEHz6OawV5BJ
 chtI8Wa7qse7057kEklVh1eJEhflsyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270076

On 26-08-27 08:39:41, Krzysztof Kozlowski wrote:
> Bindings for Qualcomm SM7150 and SM6375 GCC clock controllers are
> identical, so this could be one file for less handling and encouraging
> future grouping of similar devices (like SM7250 which also would fit here).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
