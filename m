Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485204;
	b=QNGovr/D9IRN0NeQ/L0XNY/wYgSiZ1ZBISYhzU+IZuK9rO7a9xEmKHVetJB7+dBiFs2V
	 YhhDbbidFX4papw+XcAuutITZPxccygS82Wkxq80cEZYMDx+OsRnwmlLb4RX6Ys2mH8fS
	 y3rP8DZSm5DkL7I7LzEtIQJ+W81SUJpZ4cTXfqCzN41BDbvMw4DYN4Vzz0/o+GbvZrQ78
	 oS7Pt7LbY4jjZ15Urs3vqX2r8NSYhD9m60v/8lB4UhsmWvhTRxJtetEopg+Cin2Wnu0TE
	 wtbvojTlCSDxcDL4oRDjVikMjQQhSTijhBPkA3JK4zBVa/XlvBHQC9Fo/GPQbZhhY2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oRzRowuMjTP88VBZ8dPkOyqRLsqCyjmuEpXxgbGUTPU=;
	b=QZPTIQ2csR3bwzYr6xEj8N7SRxZS6vnFGMBZUblMxdbnot6SIT4v3sd4Hgg6QWbLZ5Ab
	 LV9eBOuwygqq2vRJ+tmgKdM6KFaakXumrsmP78EdAoeCTsEp6q7xOJeXcoAg1gTir5At/
	 Fyiy4q8nPjhyHrEQx7A45+BbhXH4ZCL547HpMpTiLPMF4rhnw/WljlL5VBYJlY1r/aSfe
	 4e6qpdmmCAh95P1HSoY4uXWe3z5aJLJtdf1r2SXJ5NsC5cw+7yX+pCUwZqw2H2x7BFi+j
	 LO9pl9JGoJ85iUmddieeopYxdKvsrkcDGx6Np58kVLyqlVOQ0PP5vUOKHjWrYsG2yag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oyWFdCo8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qv3KtVOp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F252C606A689
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F252C606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oyWFdCo8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qv3KtVOp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANLChGl189191
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oRzRowuMjTP88VBZ8dPkOyqR
	LsqCyjmuEpXxgbGUTPU=; b=oyWFdCo8sTFYiL96gZAcLEAhAZQ2k5+PKIDRjXPI
	HszNWQvihV3C28SYyrUEAhBLYFtXKV6NOjtwHwgJ/SPtm91akqEOoh7nI2eGcKMl
	OwWtWmW3Qzq1PtQ+J4TcBAwNRaLWTLy/cc0dNvIphr6nLJlOnpSfJhszasE5BO08
	careylMaoefkTLsd52o6kdk52IgJ4B48OTQRPeRrDltOb24IjzLtqhA11KNZ5m+U
	N/8mWKtvAOkn9jgxYeDGr9+hjGSi2r0UbuflgVZgYddjrx1zyXVYuJ5l/mQvqF10
	fIMZ5C/5jlCLbfU3fBRIybi3Ou1MVJKAlPlzCX/2utNbeA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6srtcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:53:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so4402429eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795485201; x=1796090001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRzRowuMjTP88VBZ8dPkOyqRLsqCyjmuEpXxgbGUTPU=;
        b=Qv3KtVOpRT2PKBXVaSrBR1xiJlneqCskhka8p7rN2jp51wJmpdO4pOUycpy+wIJvxi
         zunZ0lKBoAZVp3hR9zTJqesIhVVxUVGoErjB6Tygmx3kaB6CWyuQjupW/nEZqs0FqAEy
         3NpY8D64HItnOCMeNqIXhrj0Hc57HHhHmKs68K1aDjP5KQlRdMgcHU0yOdbShSzP7N+9
         fDYOq88rm+mYXtHSJ/rJCPeZ8VYCnfafb2a5wnDRDM44bOLmBn57wqiMfB9IV5xL5aiW
         wanwvkyZvOsCFgo0y+9pGxnMjqvVzmz2heUAGVCeNeuoua2X3BCm9yCfBantAtr+YPAg
         7tAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485201; x=1796090001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRzRowuMjTP88VBZ8dPkOyqRLsqCyjmuEpXxgbGUTPU=;
        b=psMH858o/MuHYU7NTofwU29CESu5BHcXJk9k+JeNyynWmuAZkRRW0/3LanulNlPT/g
         uuJl7DO0tV/AgqTSD9b/AKoAvIZv+R9ZYuRoXrYNlb4ycksrhPrN8w0uo3YBtAxSpCZh
         pj9ZIowfJXpxZvOAWMDzzOz2Vzx7Jp1QDwMXJeDbJJ7nt95Z/gwPO84MoCPZokWjKZz6
         5KR2eytqFc/iRyI6snu9S9893hyjXjNJVxl7CPCbTw9zQGL9kTOnqsAp9qLt1INXmDhm
         H13GLDFPPl4IHeVVYslOnV+MYenIdaCGJaCilwVYVGu/hDJFwONU1FjCaKt5u82Ve9Ed
         g1PQ==
X-Forwarded-Encrypted: i=1; AL+hErH2hpge8Y3E+DVJ+u45iuRjMZ6eXntcsraAtLMcpyMkb1FFUA/xXeFRXyiWIyvktDnxKJ8tLwYMMcnZDQUG@vger.kernel.org
X-Gm-Message-State: APuU4Z8BFTrAygUs3n/ZmrYPRCoBztXq2xIz+6X//riDmmLSRZ6oASUn
	m0DFC85IRwBJIl+Djl6jSR76IUebWuIzviwl/w3VNauKDK0S8gyWFjBl9s4JGoHGbxa3fe2Dt5F
	e4uhmtcUwseiuSB1blFP8NTcrfyqSD9nStOKo7XPS4D9O1C/vyyqtS4Vkcaqad21TDl4Z
X-Gm-Gg: AZFdTZfWK6ADYbBuDWifN80vbr2dhRnxGCEfc+OZORhEScxYJUpzu4wYi3xOcd2N6s4
	To1/vJuR9a0DPBGpVhVYFeR0YdfG/vaWTY4uLs40uWxPsYmz+caawViI7dJXYhJqLY5rdyLrjA3
	BcGZPXB+nxBV1ZqO93pKBC3sHcaYS5xk6WdWwN3NCJqKcseE3TNYeJs6i4Qinn/gEhg676C4DBb
	Tl1iU649mboNW19Rb7tsGtXcFTQWn0bCbBB+5+uSinTXqAioGVnesOrRMDo5YJapvP/8QFHnAG3
	v4uoft0Dt5HHyUSzKecTu+GXiAiUtHV+HOcbuhbhgFFrfiJJHcaMYV8oRSytleZW5lX+mjtEO1V
	6hPRfmhzz/wvtaG6FXoSSImHBDoSQhro3RJERJfAE8JNIhKFOszPKaVC1BGIKPN8AIHMaRaGb/k
	q8Rtc2e1X/kfeA8mI=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr14798181eec.7.1795485201222;
        Mon, 23 Nov 2026 17:53:21 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr14798165eec.7.1795485200733;
        Mon, 23 Nov 2026 17:53:20 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm43160022eec.14.2026.11.23.17.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:53:20 -0800 (PST)
Date: Tue, 24 Nov 2026 09:53:14 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: apss-ipq5424: Drop unused qcom,ids.h include
Message-ID: <awTuCjZhZKgGM945@QCOM-aGQu4IUr3Y>
References: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: VPAsbcArYysC7prVr44nWA7jJbGWZz_0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfX+R3IxTMgqTJX
 HaL6Blj44+kfh8fwidtOJ5qv+WriyR6FDxI5CU4RxgB5SXxvMDSCUNXY1zq3czxm/nRoXYqKD8H
 CwL061+KcbB11x26sfvT2zop0MsOUOA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfXx8xNJPKhUG8e
 DmpPkOLlCksOmAG2W5V7+3w/p5jiSkU1zl8FacqZr69ZJVXg6TLalpwf22NChIXbiX+aCXOOMLC
 JpjzaTgnGv0ieSQfAX/SSIfybq4H6MlsPjaddbgEmTAPsdCNHXrIfZDY5SkectyDaNLXufdOcKs
 /f7QObn/G6im3Bm5KJbBrswF/2rwsgfUL3TnIlTdr3F9SiHdDr0a1hcFMtYdU7pn3iyxAh2qw+0
 LeCIrLP5acY3gF2dPRanokZXe/IdU6437G1Qm9Oz41CqZcKALunQ60sNk07Rzexd88nrz7qmy76
 CRLViOn/xSFUUXCDSUfCetpE63tOqQs+F45jbJju3npHT65pVZBivceH4kgd5lXsdbSOITQ979z
 +Qx2T1Pc5XWCXHXJeQaeNbeUvJJPjMXfFf6iDhx4VZzDeGTLEVK5SjrSTtHMX8qdm7GEe3IDCH+
 YwX6uEM1bcOKT6nH7nw==
X-Proofpoint-ORIG-GUID: VPAsbcArYysC7prVr44nWA7jJbGWZz_0
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b04ee12 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Cr8ZdchctFYn2ypy-6UA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240007

On Mon, Nov 23, 2026 at 10:58:43PM +0100, Krzysztof Kozlowski wrote:
> Driver does not use any Devicetree binding from qcom,ids.h header.
> 
> Suggested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
