Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D0248F72
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133680; cv=none; b=InIpZkkN8GO2ALXAgd2Xx4pfx27fyAGCNcGehb1nvNvQqev4efEOFXd8cVZvZeurk+ShNimApAdcbETj9dOeIk8MizP76HdFZ9pyTzLxxjV4zXe/DxEZSr+S7eBjfh/zusTE8sQemj6pQY1sUm6XaGPBoCHP1SqYN1AidNIUV2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133680; c=relaxed/simple;
	bh=CQQOsVNYXPWgs9fvED/8XjGSPi4MvN1+4E4vHhPw2T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7thDgi12KUwQ9rzIFV4c8aoMxfr6q2U7tH+kdgGE2k/DzNtNLIt1ThVzBEHBe/3Egee8XLT9BXNYkCMRSRsXAXO/PJ148iY1JZ0X/B2/+flUrdVugyMFYPDLuitgS25Dnei3BGOhdmzZ6XEgGiGonqK4vXiU/fSFZBTORIQaTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXFLrFwc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3N40qMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXFLrFwc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3N40qMm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjJIk4040979
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nK0vFGtg5QgNaoNnYyvBeTW3
	5yhfDRtCR7670jeoDy4=; b=UXFLrFwcDScuAvtfIug1g3gLhqLuH9gKDVVCAgkG
	9evBkgMeujpIS2NBQrZFsA8cCSv38gZBIBUzIeqTiynFMzM1rNbFmaICqcL/PR9U
	fAp0julQB02eim+cEKXrKGOXnz6LyFHWer3VLxOVkEwXuY/a47P90gQX9FeDH6kS
	+sCDA2tdKYlkqv91fB8ytpFoce+UGQbKpKPqb6ETLr+yZ4Nif4jJnCugOyvKCQf+
	XSFVg7tQ+X2bU72ur7kTt6EqB3qybb6hr28hG4EWGLruCFQ/Hi2EDP9rXb33HuhK
	vdMdowrXxCxnfcl5TjDZcU73eNo7KBH3VsdzcvJMwfGoZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2c3ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:34:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so165050885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789133672; x=1789738472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nK0vFGtg5QgNaoNnYyvBeTW35yhfDRtCR7670jeoDy4=;
        b=B3N40qMmht6ElT7v8DGl8wuKXTqWA5Wa9DR8eqjjVLGe0mTW8lwwZr2uaAr0TVqk1X
         btzIyX5KGQxP2+Hapn/eSy0rWq2kvykLq6ii3dZTwVu5neL5+xYQVJvxSLut1RePeWvc
         Bet2Np7LAGrGsoAqP+8PDwoGzG+floNfx3EibiTTqY60zBcLLQUFiPpeUgY8T4qJ5Hbc
         Wt1Z10N+wm+HWu5RCzS1XJ0EIRwq8qw4dxbRzcTXgEO4FkGiNLkul09r2vhHl05EAfbZ
         Q7aLvw+NmXYaZHyL9Ysakgpxa3s4smMRTz/d6pCYeJ1dDLS0xVfpajjUOCS4VKUbOzI/
         E0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133672; x=1789738472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nK0vFGtg5QgNaoNnYyvBeTW35yhfDRtCR7670jeoDy4=;
        b=Z3QCa1BViUH5Us0FDlF+TOugG7+A3QJ82a/tbIgNCzTgtmqz1Y6XafaWQKheauBWfU
         C5q55XqY0HlWzNaiK4sUg9Viik35MVcWEJO9rQp9pC1yl5ojOO8uLQvwTRoLTxrwOKJN
         Jd+Lmi4/n8dQhGY/uzlwuJtM32rZ2xD9dV3l1She6No+A8FfYHu/4+8j3d2E7wxuZ3Nw
         4s6//rWdSRleJD2Vv0ZnSC8Epq6RH3eSuaYLJv39b+JXUFAi+tU0STadxmTwUiO9g5lU
         zG5AAdlCEC8+ecBr8xXywRhicHU/w5vkTOkSRG51lra+bBS/3dsC9TWdMPOxyhMAzjht
         rZIA==
X-Forwarded-Encrypted: i=1; AKwUvBxtOkqXCxa9seL/1s59pEj/htpFZWCnXaGgbPcPatOkK/AqWvDijB65huKRoUTIVptDVtL5Mhf1kQHAmc7k@vger.kernel.org
X-Gm-Message-State: AFuF++nAGO9kN+5LZQGBuvji09oL9GbOU2uYoxq0OnCAhxsARWjBrU7o
	iCfiJ/WNKgBmEY0p8sxT4jy7xeKeYTtGrjacuAK08h5e9BmjSPgtpFU0tQuVm4z4KELxe187FFb
	60TGTpVeKfZJ+9ISRqWOMq3X9YBQDAY/q95h26DjVdByvfmWhnEVbVaABYWWAbzurvvGt
X-Gm-Gg: AYBFou0F6fDc+xmTlzBM9lHB2voOFHS+bskw+WUAsPjk8COxC55NGR8W5mSQzOi8rI9
	l2U6vaT7Qr+lDVZY6y+moMjxTm6ttK6ACioTHipbQ2eIzjYb7EbJGhRx9A5vJcMe6u4pGW4jiGO
	AX0UJZ9WWI95wck7CtzMi8mg1SsErPrKDxSg3ArXg9Yn5Lu/8Sv4RJdslz856DmCL4D5PrfFn/s
	lEoNggWrMD26L05fCiXv1NhnabtSE/enemajRKC4ppgYhnT3e7dze/MruEAYuIJjY6FS+HRCsS3
	wsdCiAhzfIekR1Y8xyu/4En2gpoYt/XSw/WNjsr1WYe3GB/B5hx2Z3L/26bX5I8f13HMvRlgFC0
	3thMw1FDB0wOPyE8=
X-Received: by 2002:a05:620a:6506:b0:936:ef9d:2c74 with SMTP id af79cd13be357-939ea212a7emr626818785a.30.1789133671697;
        Fri, 11 Sep 2026 06:34:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:ef9d:2c74 with SMTP id af79cd13be357-939ea212a7emr626809285a.30.1789133671102;
        Fri, 11 Sep 2026 06:34:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm5358056f8f.35.2026.09.11.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:34:30 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:34:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 and AudioCoreCSR nodes
Message-ID: <oa6xnrgves3llyn5ojc2urmv2yrkrcetwui6utx225r3hiqzjr@rlqlp63xqji7>
References: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa4036e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tlOuMNSg9W14aln77gIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fGt0gWC-2YuG2f_B_lNl_4NqN7OQGoJj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfXwEXfe1nOdQNd
 n2p5D96gfwn8nhgIf8J2A1hhzB2ETu4OY7cC9w0y3zHYI1oX107R6w4dB6Ja5hoJ/4y/Fsabzka
 KGLGVC4Aoy+7j/1XNTJhIi5lSL55hg8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX24ZCzex/NWTf
 jDE3iN2J7qZFI76JeoIoG/kqnTI+LeTPb6bYtSIb8Mgv0727s58yAKj66D55GplAxi+vEc57syJ
 sAdttSiJMYwBE/n95akBPoHcEDDz4OE8uZMJ9wiJiBnslTboELc/rohaF9hEhNoibf1rsndcprJ
 JK53ujSZKlEzykkkNN8urZ2Fq9qw1B8Y+ICPT6bDd/jta6/BUZtCK8fSVHDNJfuJ0YNCiUXfovo
 CMY6XsUMgrGhQitWW6U4FrcainQCH9MQBvSk+CzBDQ/PWncvkepG9xqjSOU9IYPG0CSwpmvk1rL
 Bk7E1mdfDrIz6DeqlDj8yEFfYMOd5zVbSEwxoqu9rqrlpPsvH6puWtb226n+dzmHPKcNbZ/Bxep
 ZVJ1OBIYppuwy09OBhYRhyLBtvJh8X3UeDoSSbXkAlXfRYElvO4tuNjLU8Ns3vnA2+Z+9FSIa9V
 fQUf9h70T0BM3imxYXw==
X-Proofpoint-ORIG-GUID: fGt0gWC-2YuG2f_B_lNl_4NqN7OQGoJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110189

On 26-09-11 18:06:04, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
