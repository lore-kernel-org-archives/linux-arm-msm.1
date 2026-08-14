Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F8A423774
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692840; cv=none; b=RDkM3dZScb0XBBtJvjFy4R/DdUgQkY4sUNaO8V2ALikNNc8kGYTPtuGNWfrCltmDtm2PQ7vfg+IZOPxOZtnkB0SDTW5kUIbnZi7wDK0njJXEfoyhHGSFpqtq/lvWjtISRM6GkYuBksErSdOXIfSLnXDb+vGW688PlD7PdT4l3YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692840; c=relaxed/simple;
	bh=vL1ammLrJyXCzm52KAZznQOjQx502y5WBIbpYHNdsio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlLj4OV/JWClSpankcIlSnT22GgJUDPsJ1X+B9Tgsp2cQ0sbes+k3PCM5IgXME4rrudqdC/DYETfWWcdgEdS/xh6hMF3Xh3HtpQMxSzEFPfqKelM7bWQVVsKHxE4ST8VyxYqV+ieEkLX4HI4up3tX7ESNJdXaUSnsp76O4+ibN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVj/c4bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZMq2ayJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVj/c4bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZMq2ayJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QxTu980271
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=86t7FtJbfTtH9+F6tc1w5TM+
	iyE0kvnL/OQSt2AAHuk=; b=SVj/c4bhl+F+FQdHMT9zcV7LAGio+KeiN5bTcnqQ
	n1mYjBGFDlYKUGmSm40SykSpN5zJeWrxsSJzMwIck2YlQxSycuopE1WEnccO6lPW
	jdUgrd/M0P2OevSMlNJlSyoNEPu0Pk/8BZz4eXhIDriehpb088RwEC9bdcWBthii
	tAf3/de3ucrOLBVQUlBmx6cqojJdl06c5e0i2OK8u6h4W5VwIGsefWqddl4t2yBd
	72uNWsCST1WV03M4s+XAzJp3/U22k/DwgvGIaVy70HcBUkZ9sBaVA2gF1xQzyA93
	Ko4bJtGERXm+/YvsJEDoGsd7fA1dylsD6fyxwlb7ez9mHA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea1qqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:33:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so1947415a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692821; x=1787297621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=86t7FtJbfTtH9+F6tc1w5TM+iyE0kvnL/OQSt2AAHuk=;
        b=MZMq2ayJMppOaAHBFkvTu4mgKIulEAsefI8ZRcUWUtxDOkztRYS28gGEPC93Rdt5G5
         sfMJE2Z9H9DQ3r7zE5J8osrQPvT/X1nKwehQAUdOEdB9Qn6FTUhYKF2ZtZleO0xlhfVX
         BIcuOAE4aOTV6xzhSL5Eu9VBASSz1F1VPT5+YOehM2eUrYyJRoNeEBPcbscQH8XI9XWF
         w/9NiyFCy5yBznGcvqrtu1CLTSrDaq8nNjL+sFVWaQUEwRrZW418gArwLeIuCo/G6OuH
         XpfmehziciBR2pMXl4npheI/4rG3OUSVppFQlpSOLozAcEOQhkA0vkeciHNsuw34etgL
         ifEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692821; x=1787297621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86t7FtJbfTtH9+F6tc1w5TM+iyE0kvnL/OQSt2AAHuk=;
        b=cdBU1KvsR9l9VyBBPRVp5oHW9nol9tKkCg6iqjKest8WT5IEBti/lx8nGmb/P5iEj4
         GffShzFj+788ACXtAjpeFnwYARmy2BPM4x3iFcDzHJsdPvx2gEeRTgFm7yHceZj7+CB7
         zsdeF25abKX+vo7+zKsWgkw5pfeGa8hTMMssXxr7VxtyUTEqpf4GUy2SoQK6mfpBfG95
         v4jRki/7cf21EHeYFvGWYxgV3YVTB+qX9vEnQcL7OFYDRNpVQpR2TLhKzuaurHX/Vqv+
         V5pGy5XvUh6J3N3qCOE/VBrQXHWwq/JyyDLq1HibrAL/0z1dvp7sA/rmqONsIKZrB4+j
         wI3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr5JkYN+ol18qO97TDFGtBLEO0hoRSqlKV37hAiINqEMcoEDqQTj03/NHWnfFPANzh1s0S96cW94FpQ0+EF@vger.kernel.org
X-Gm-Message-State: AOJu0YzpwzrMDZs9fojnXifl2WPTq/TXBhxKI+VzBNdYJVCQSwdrjQ55
	lRKxYjeKHA0CfDre+7l/6BD0PCOhA/c+k1nD/UG2ez+PP8RgE9lsZ4/bqK3+uffrNonz4b2+YIB
	w+p8rh8Xikh+hTKe456NySGQBuiYc3w2klbNJntxZWrc/f3VDiqYANFBQbwlzbaJPYqkX
X-Gm-Gg: AR+sD13gOl+5lh//8QtUP1xNyE/2T5cpkSenxbQW0n4IhcBGw0fS8mbjHbvPuCqfzjc
	H85SEu63KdnbOmvqW96De51eChK6Mx+KNdSznZ61vQp1WDKCDAcsBANaXq1LeIyfxS9Ers+OTQe
	gX2G9xoDzN5M1LG51Dm12p/j9n9+llUqvAZ4KhsQkT0E9OZ/C90sNCaPxV1FfIlQLHdUPDyoinf
	XT8zQVDDjGK8+++SzwGhmoJvc1O+xgibcwRO9XgOEkuRFiQsdj21BLDGEqDlrBXdoIU/Xb6IWZC
	cgjbiaRkBTxe0Uact+g8z0PKVJmP4B4eGklYBGK1a/F9RZrbnL2Rw73Ku26oS4cMBIFHxscZujD
	wFnzLmHnxa7EvOuFUNhFn2LmJIw0=
X-Received: by 2002:a17:90b:2c86:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-3933afc1382mr3188376a91.8.1786692821254;
        Fri, 14 Aug 2026 00:33:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2c86:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-3933afc1382mr3188345a91.8.1786692820619;
        Fri, 14 Aug 2026 00:33:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387e49d3sm6408911c88.7.2026.08.14.00.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:40 -0700 (PDT)
Date: Fri, 14 Aug 2026 13:03:34 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260814073334.7orbdongswfxgc42@hu-mojha-hyd.qualcomm.com>
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7ec4d6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=K9csx1bNu7bmPCVkKm4A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: u5DXawTUEhD6_h-AhjmpwTKy3Ik2L1yX
X-Proofpoint-ORIG-GUID: u5DXawTUEhD6_h-AhjmpwTKy3Ik2L1yX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX5h3Air7F5hqq
 67Iv67Pzji/rvL5d0CSf/bMlssuOedUUHJtZ+vHv/d6YEyCrsFXtCekGxBC1uE1BD833k6e2RHf
 TEyZPVXC2SuT80aePUQD1bt3TwztagcyzlpROG7WRycp86YBi00QY6jY+ZfAcmquBrHKjcNfP0v
 Z0AaMAJVG1HnMr8ndjGepBNt1KYcC7LOW4wjuNYN7RIueI4WN70B39CfF43xJWn/C7tonb4XYuV
 bP/o6UP3ZhXpOhHAqbtNe6vMY3Iue2JwBl9MKk7ODrZcUfVof/AID4+D3dklK0ZkjQjs6qy+wbs
 jR1+u/zoTrCk4WSLyanxCxBpowfFGHKld0KsTIsASGoRTVCSU3+5vZN36G6NpCJqF6GbhYi3J9o
 3EFCNdLMHOQA+X5q3vhRgxAgSwpXH0qGbdQDl7dTTZh8xfiSh7bFG4cvLmwmnnp+wSu20wpX07C
 pNTy4xkCMmJY1NXjkDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX4PMlZXCG271j
 izm/DpelC+nBVdqzIDjE0MEtiwe/kfxKUtrzDZdkieD7LIdSGt67UR3ckqE26mwPE9D+KV93dDL
 I9SDSHwBELNBxoSDUSye6qs8yc5+UPk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

On Mon, Jul 20, 2026 at 09:03:26PM +0200, Krzysztof Kozlowski wrote:
> Merging:
> 1. First two patches via interconnect tree.
> 2. Defconfig a release later via qcom soc tree (dependency to avoid
>    surprises).
> 
> Changes in v3:
> - Update also Nord and Hawi
> - Split defconfig to separate patch #3.
> - Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
> - Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com
> 
> Changes in v2:
> - Patch #3: Switch to built-in for everything, with explanation in
>   commit msg.
> - Tags
> - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> 
> Similarly to clocks and pinctrl, interconnects should not be a user
> visible choice.


Looks like this got missed in this merge.

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
