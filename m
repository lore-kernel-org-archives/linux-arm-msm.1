Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659D4399361
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025503; cv=none; b=PjmIpkkZsa+1Tvhc3lRtU1UDWWTkkod6IFK18E/u538SfZgX+uEN8uZ2MV2tqmj2wdWt+Xmh4jgqUqT/iB4/NYk7GoCceb6MUO2bziIQn2RtL/nwYXxHuwpiCIyAXOE5pXdkKub+3bWOqm0VAVbyI2V7AgYOSXat70xGAPgcOO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025503; c=relaxed/simple;
	bh=Zn+Uzhi/j2vF5DFJqXH0N4ZBNMY4utcDCtgBbqStyGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjTz4GG7JUtAqcpe63YHqhgXY9nC/8l2lnfxnJZTeFspM744AtQ+RdpVeCMnSubqSwDVJIJidZ7KlT02SanybCj25BQuyNNvbiyChZHIjx4M8kkaMI30ZSzK+cVA/uKHhZa4UXEoiOYjKe4IpCIWPcbQqNDIpJ5IGcY8FExc8fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTrWvSZg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xz2o43te; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTrWvSZg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xz2o43te"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GqWJ4058877
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hklCZ9GNU8o98OBsdb7gZIJS
	dTreZ28T59haFWN6/Ek=; b=GTrWvSZga35TcpEgGTjZgPIOZPuWBXll1tN5hXU1
	6RMcTzL1hgvUNdx3HM57YvdNxe05/eZbxRieJ+g2dNyfFxm+yefUwfCiswhPzmt7
	4RxKYmRBKhaZxhCWH5fQmCuRM5rNGZKPk6ZeJCpjVIimv7PwPgwJS9iArH6CcTjs
	IJWJwXzxD11E7Fe6UYAkfJTE3vuKqWsdIXVll6Pw/vys6FiPy0OBjrMG7quVvO9f
	SrfADFMsti2oaUVv6niG0f3z4ZWDjr8npp2G1pHea+1QbEeSw/Jsa45Z5Yg7Uu8l
	ZdSqvShZ1gl21oRN4DURDaeFST30fGgf4HN5Te5PuFFD7g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyftpd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:31:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c58ce17b10so7433579e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025500; x=1789630300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hklCZ9GNU8o98OBsdb7gZIJSdTreZ28T59haFWN6/Ek=;
        b=Xz2o43te8tfJvAAGPBEbqDrBU+Lps4DpJ6Yf3fn+ojd+XdKjwclqsRn9uMFHzXISrx
         TZ3VQbDWBZKE0ZhU4OzgiCcBqEml/lkDXCTxZUGUnYFy6smwoxXV/nXCLNk5ZKpWQ+VE
         8vYsdzhQzyyMWarniQXG5bbpk9IWNGZri2x46QGivGHPZAc6OmWjPGyZlQ6vXMHl593U
         +rBaAY+CG13UTn+wId18BIWv/8d96cjfx5II/RXbFqzwQE3kEzwMNxMx+WymY4Q8Z5ej
         BxoURklqyQmIV8LqZ1NxfCgVYNkFir7OXYqmi3TNmo9490MWLi8qDgaPMlVWesz3/99r
         wb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025500; x=1789630300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hklCZ9GNU8o98OBsdb7gZIJSdTreZ28T59haFWN6/Ek=;
        b=IvR+d816nhAxRTGi0SfJd7PdK4NArgw1GwfrqB/Tmwl5KJ130DORsSd4J658kiHtk0
         mC6seDNqDa9UiWwa/zOil8Aym9WKEbOMM1wMhp2WgzgI4RuvBv+dYzGOQ1wVvyuSFnel
         MlInzOmc3vsNcDaqRxQXcWB6gwJEvnAx2GK/Tg7TXwwnYWh9hA/V/8sADRfOy5FFCl13
         nv0cAxr7CSwfwwIal2rIwTISEejpRNemYBsCgH0HvYfJAHrc92QdOfbCxUTK22cqGHds
         8gs6pywPgIi8VUXRKQ/w/840HuNdmzZV/CCNe5pDfAHhCTLU9i6RJi5uepqPb9fBEzKP
         0woA==
X-Forwarded-Encrypted: i=1; AKwUvByb9Qz3ztiJLGQvKkwK8COZ411GSvmnST2g2DzbAvp2KikGCP3RuRR58+3CijJZ/jSu+cpe0GK+LqwFJVO8@vger.kernel.org
X-Gm-Message-State: AFuF++nM5843ZagvUO4+EaQuEye8GZe78pFysORv59NvrQf4/Z8H80q5
	Z89QltY7VpOBGu91UUWzWsC3vPdVDoWRgANYbK1dN29Qgrjf5/XrRe6u+UjQCSD18HHQfclIBJ5
	s2TdcaKGB9pfDrtwH3jfLDTj/pduYMgIuKWPFRSwlp+nIXnkie9XnTBEKxJWZO2Lf7XBd
X-Gm-Gg: AYBFou3CToW/g0amXKbXco2copbp72Bc5I3U2Tod8sQN/pk8osLbsEHeP1schPxKFYd
	D2hwyqbdpRiob3a9m4a8WHDWrtAM8jWB1D45UCPsZ8vizKgoVvVAUE1mi4puJwm8XjQ7haCBMPS
	r/AVw03SshhRmvgZeONFmfShvVv1Sy5ZU/0rqoMSKMngDmns9gwWmVaZxqWlsg3JpPvk3Ko2JHA
	/bHRC3dlC8ehKGBcw59/EeyRjBm1jpAaZSafpbVdGxTfBxA6SAfqA3WmtmMlt5CZuUOkvjpmQlM
	8cOtWz5oramhJ149iszBqxLkexcslZpUWl3erQGO0CRa1tvfQ4ScDFYhXq5Fs0ok2ePzcguasRO
	sAMv4YcndZQM=
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c7ed81a500mr158539e0c.7.1789025500390;
        Thu, 10 Sep 2026 00:31:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c7ed81a500mr158506e0c.7.1789025499938;
        Thu, 10 Sep 2026 00:31:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm56091475e9.13.2026.09.10.00.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:31:38 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:31:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] interconnect: qcom: icc-rpm: Program SMD RPM
 auxiliary QoS ports
Message-ID: <6xhje5yh7yqfabg565uhcch3vyyisvn3y6ylhfhocgh4gi6noi@of4g2ekj74pj>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-4-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-4-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-GUID: ThbPOOgtUmkjbeZwLE_ZxFn8FOZUgWqZ
X-Authority-Analysis: v=2.4 cv=GNqdgeNK c=1 sm=1 tr=0 ts=6aa25cdd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qOZR5Tkgscv2fS1d6PEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: ThbPOOgtUmkjbeZwLE_ZxFn8FOZUgWqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfXzVWDTjV7U7QT
 SueU+f1Kzj0tRZBqUkAHhT2cx24haBB866Bq28afF/yESl1qnTdoDq7FOjo0UrDXp7bpH3JEf8p
 57Eqs7WNW3SV42HgUhL6yxSE1IV7MWPSDNjKBFqwZmBUlygBtnMlc6bI6Elh4Rols1QEBfFHfYS
 RTsYSS/U+imMaWK8k4Nls+n4xoEZKcie0MduWYY9BxPWyC5ZUj0RBVh8b4xaqxYNSTblESLNX9j
 LhSBjRoa14XSyoBc0QSKqByZxaQvb5zLhf9m3NNlXztimWc1g5exSS3cLv0AOMJaTkv+g360Nnz
 xxn0+5Kc3Dkhx0HZodffeJtxPj3NwdpxgDQxguoFkShSh5vk2NMPzM/JexVDcBWyaK5pq2TrCtR
 7vb16/ow+XGp1/PEMxGWp4d+k46jzwWjHtbLdvrhbb17quqsYQkdafKdcEpAU7Zc5N5K6dGSE6u
 d+MKP37Wl8s+COWLlqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX5G0qv5vLVA0m
 LTI++CSxcqUzlb0yRQvIG7mr1qnSRSQVmohvgLLJ7DsSdNp2i56XnudCSITF8kO61Q3sq93XWIH
 aOIhoyLmcBmtsgZa9xSGfUW5CCfM6i8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

On 26-09-09 18:41:57, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some SMD RPM interconnect nodes own two QoS ports. Currently, the code
> only takes care of one, leaving some endpoints partially unconfigured.
> 
> Keep qos_port as the primary port and describe the optional second port
> with aux_qos_port.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
