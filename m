Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F3F3BF66B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787254315; cv=none; b=XE8YBBB726Q0wT2UHJKXfOjs2ln1gaakeTnWwI77t+sd1u5+8Dk56kHrfjnhjhgQM/ilg9NgNbjagEr8EQOIZdXl9Uf5HUz9XP6iyntWtI2NInczjrXMOQLsQ+PxLpIup8wsSoFA3/vtroUbZahGyqBwLXnH1OiEeoDtWWb2jvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787254315; c=relaxed/simple;
	bh=buYWTX0uLRFSFElpOhOCi6lNLyb922r6zQZtzMYXQGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWisr2JM8+eXYwEY4QeNto9E5wcE1qHKbnVJ2nFdX6FpwcBlcM1GTVRXFqvF4N88JaAV4G/ltGupFUozZYF98IR6dyRjqpe9Ae0S6yV4vUVDRl6g40Zv4W8oO7gDDOWwNO9PjeOiSwI1PfiSHVci3o1nUr6yJzXkmtAHppeB/Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFPwPNAB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCEb0C+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFPwPNAB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCEb0C+X"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIIv6K571549
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/b78zQyH2KktyaZ8ILgT2EEZ
	CMgaqsbRBxYI5c6jus0=; b=kFPwPNAB38FNi1anfHcCqcwc7XeNh3hUnW1tBlf8
	kQqMyX/TftqZu9h1vReikx1iD18ZUx6ODDZJ994quEp2a9fjDNetOTqhjuUjx8Wz
	/037mwnl2yU1o1eoNvP7e8J/+D0kvGyGpPVWBHgp7CpxCSDAXiCV4A9yREJ4Xxhk
	VkoTBhXX+aGUk0nLhI7eqiWnNaeyYVF3iP4ndKj2CLu8NtSCcxn4jKO0a9mOA+nz
	cDZsdpI/XERL3BKSSuh4t8fVPun0imCrwMuu2YwXrK9Z26forIA5+LsSitax4ZJN
	e8romIjE+Jiz3Ym92boeOR6SxvHT0PmEYh0sMCjO0UzuOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcaxfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:31:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so35885185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787254309; x=1787859109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/b78zQyH2KktyaZ8ILgT2EEZCMgaqsbRBxYI5c6jus0=;
        b=hCEb0C+XGUt8jv+pDd4ZHCsWccbMPO0/vLkyB8VdFZ4m5pVwL2zb+XXjSC4qx7VoQC
         dWejgjxFIwY6jQW3XHLDHiP9RhG9gN3KdgrgbdpmEP+EYosE6QlraL8J/+5N35kaopW0
         Fl37Kof9QH6XGPhgbdTkJviI8WilsDEgBaj5IScayAqidtpsMroki/k6HcvYr+d1VDOp
         WIXP8AJIjTJpeWXbVOd5iSic4ut+4QqECee841g/Q/HYeZIUTjmN/QWqLAqM1HnoA4PL
         +QQPrT2zz/uLCejtddkUAr1R+kXMEOKOj6JbBrU2aVqqWj97XiCo2PuXkuoD0gYQnD/5
         tWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787254309; x=1787859109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/b78zQyH2KktyaZ8ILgT2EEZCMgaqsbRBxYI5c6jus0=;
        b=RtIQVOWgBW03wHRD4b3mZQoXUTAzybjytwPFvhbI8eQE3NrEf5cTeJhIfVvVZpQMfb
         ur5qjvKOLijON9b6eoc1Q3lxp0i61+eq5DYT0H8MdzeeTOjfH0eqIsvCi+62GJuteo5C
         EVbtcuWEzPU+s0T3hfeztbaxIbtj0F7Xhv2B0jy8Wfpu/sBKjR8wYViIn5/+vRRjkP3/
         dYnQ++0/zDVV6RaV394szxlpH98pMAv2l/AwNgvhLBEj7khp/9lMyS2+0GhNrvFqy1+2
         9BFWs51VkpjP0fZ2KpQTh5/KglsVCPNhL/XzJ9FykB44aKrsq67veTuwosIwivWg6+zB
         SxZg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5hfmLsv9D+JRojO/M2wjeTr8x6GiTZrURpbJzL9k3w/gRWxRdfgHxbWyp7YPbsQl9EtSccdRbHLAEezMM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9MlVObN51JMRh00kgWax/1+lsVQi8FI3y4TH4jNy35slrK4N3
	g0O7tXQrHKG2Kk6g8Xe09kf5n5gdH6sRKBkMJVYABvux8oFTzDdq3u+2Ru1Q2vllFixchLn4PQb
	DB/E5Cxrea0JjkjX9267BlZHg9l7csPoMTOQhsQXMAC8wOjVxdSBOMZAx/Yv6luappnbB
X-Gm-Gg: AR+sD12fqrma5FQQSpH56ZurkhK5Lu9MsaOCXysKEPDZRyqLRSpuQrBKfEFtwgFo6Sa
	GuXq4upR/0BgLISA0yaOUjkx/BT3calJ3ZbnOfFRWOjKi+fv1DffyZXfHnwDKxHPL4+SDoEHu9N
	qkeG701fiwfr45o1DpcLyiHtcKx7Ui2mLqy/ozmj8rrMH7BgWSqJk/wG1sDjFznUuhOVDJglf9N
	yf19xameyesG4bbaM0rbGUozXLD3wnV4xJUfM6jg8Z05RBNInkXsTlNLBd94zDacX8qh9xJxcGq
	ICex0j7ZqP6fXrsI6ZeKVKDi/M/4+k2K9/GJrQXenCq6gj6jYa3FnGIRchYCb/ChjaIQJYH5XTs
	NWgMyYoecMaLMbqA=
X-Received: by 2002:a05:620a:a805:b0:936:e243:9f07 with SMTP id af79cd13be357-93739539337mr43649285a.27.1787254309196;
        Thu, 20 Aug 2026 12:31:49 -0700 (PDT)
X-Received: by 2002:a05:620a:a805:b0:936:e243:9f07 with SMTP id af79cd13be357-93739539337mr43641385a.27.1787254308543;
        Thu, 20 Aug 2026 12:31:48 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b914bfcbsm2614135e9.9.2026.08.20.12.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:31:47 -0700 (PDT)
Date: Thu, 20 Aug 2026 22:31:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: smem: support Glymur DRAM info
Message-ID: <zwpgeeapcjwtad7xyerz3bdegrtbuu2ajdqt5yjpcvxgopq3kq@cg2uvzmdtwyh>
References: <20260820-topic-glymur_dramc-v1-1-f714eef34e4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-topic-glymur_dramc-v1-1-f714eef34e4d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a875626 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jo7FG_STVPlGlPSEqzEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KAka0O9RQW9tlb7Wdj7X64dvNekVMX15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0NyBTYWx0ZWRfX3uSSThz9TV9W
 AOQiLA/eRvA7O35TqNZJ8g5rL50sZn2Yaz9JM9WjNZTj3N2+AIsv4eEPUdzn7q28MfMxJIO/qsK
 uls3qkn60qKvPTO8P57K1Tv2gFNoEda3sV6SGMcaTaLQ7Kn2GQUpKENsgQ0PUIdvnAOibj/dzRR
 qgSbhkCJBcNEXp3+FWWpKaRIUeCx/y/8Lc25wlrD3gt6YiiQjm07fGynZWuA9ChGkj3QEPKTfqd
 0s1eVQBy/hIFvh2MnAh5UxC5k36swrMEPTyVIrCkBbRy2l5qOjcDxuUnejRtyMli8/E68tpnzCr
 M3C7sLIqIaAaJjUVNDn80O6vj6gh/5Q08HDJ1A8W+4Xm95779sp4OfCb7XRGxzgFTX2rp2iNohr
 N1npO/diQK/Z6SgiYHjzuyGNFLx6P7PxQd6ueUIpjLFrf6ABF+Fv/jU4u5XhFFfHLb02nvh+SDI
 GmnyqHyO3Dj0fmlrGqQ==
X-Proofpoint-GUID: KAka0O9RQW9tlb7Wdj7X64dvNekVMX15
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0NyBTYWx0ZWRfX7dVNdhv8YDUE
 +dpkS+Qv9K9GhCcHXu7XGtGbhwM22rG/s+w+v7B436iNxp+WX7ZTE/b7zToIEKvPpudTCmX7hQr
 P4rZVftYZ2X3nloD8VgxunQWEOK3lZ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200147

On 26-08-20 18:30:08, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Glymur firmware provides a version 7 DDR-info SMEM entry whose 872-byte
> layout is different from the one the driver supports today.
> 
> The data contains 16 channel descriptors, 14 DDR frequency slots, four
> 4 DDR region slots, a 10-entry SHUB frequency plan, and v6 misc information.
> It accounts for 616 bytes; the captured SMEM entry has a further 256
> zero bytes.
> 
> Add a Glymur-specific version 7 layout and recognize that complete entry.
> Parse the DDR frequencies and highest-bank bit from the common fields.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Validated on the ASUS Zenbook A16 and Glymur CRD
> ---
>  drivers/soc/qcom/smem_dramc.c | 66 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
> index 63ebe7f6db59..9e3234a67406 100644
> --- a/drivers/soc/qcom/smem_dramc.c
> +++ b/drivers/soc/qcom/smem_dramc.c
> @@ -20,12 +20,22 @@
>  #define MAX_DDR_FREQ_NUM_V5		14
>  
>  #define MAX_CHAN_NUM			8
> +#define MAX_CHAN_NUM_V7_GLYMUR		16
>  #define MAX_RANK_NUM			2
>  
>  #define DDR_HBB_MIN			13
>  #define DDR_HBB_MAX			19
>  
>  #define MAX_SHUB_ENTRIES		8
> +#define MAX_SHUB_ENTRIES_V7_GLYMUR	10
> +#define MAX_DDR_REGIONS_V7_GLYMUR	4
> +
> +/*
> + * Glymur's DRAM information entry has 256 bytes of trailing zeroes
> + * after its DDR details, four region slots, 10-entry SHUB frequency
> + * plan, and v6 misc information.
> + */
> +#define DDR_V7_GLYMUR_RESERVED_SIZE	256
>  
>  static struct smem_dram *__dram;
>  
> @@ -39,6 +49,7 @@ enum ddr_info_version {
>  	INFO_V6, /* INFO_V6 seems to only have shipped with 6 DDR regions, unlike V7 */
>  	INFO_V7,
>  	INFO_V7_WITH_6_REGIONS,
> +	INFO_V7_GLYMUR,

Just curious, isn't there like a minor version number that could be
used instead of the GLYMUR suffix here?

Anyway, looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
