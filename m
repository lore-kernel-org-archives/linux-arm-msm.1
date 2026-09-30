Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943D345041A
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758722; cv=none; b=uetb7VYxpcBbhQ2EhPcVUQSpestgFv4LzsaWuzPx7YVaoR0MgP/U0pnQ5saQ1YmMzTKH2KY0TxSwNTLQ1/xTHkfzy4S+ZFw/3zHw9vCJ+p0HEUTgtKJ3EqJbk2/SQqsZmkdybi0tF9rK9aotT+ediVotv8GJFIMmhvezlp0UMWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758722; c=relaxed/simple;
	bh=DclLSPQjBnmSdixRZuF1wFUgHZD20UEbmsBV8C7XsdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSSpEH934gkNBMy0Ble9TX9LeOqCytT59iys/+iLlO1/uPVaUU4hxOAxn/Kf9Q5q2uzm9nW9aziUFxGnvj9Z5w2p2FpYLyeV23jMwg8ovVW2V1a9iczrSupg62N3wChZxgYaCfqf06wRLDx4qqi2WpSXF0pi4v7Av15n60P+oK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIynEI7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClMciLXi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIynEI7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClMciLXi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dLfh3082204
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCldqX24kRznYB/wd3GJ0ptCoXwDp+BFX6MP6pxs/R8=; b=lIynEI7r9Rv7+sEv
	rlYontRA5b+PM4QLkADn+/8qcN4vMzOJTLC2Pr53cLv4r8lJ4+4XpuelhKZK7rcl
	lqr5pCKEjEbbK4qy1kOhninZTtfZhKbCEAAaWWndSfic9Xe35EJXO/CDW8poUD//
	8EqCHgzUEaYO1kacdRZWGvELbCTyKamL8wZSNYemQDRaqsBGTRvkiaZwn9PXTVSA
	r2FtP4v/CtgUEJYJ4MHU0K2yWh4SPGUR+wIvUzHPehk1Z3vBcLKR23/qX0ZBtJKQ
	FrYaAN+AHADObxieKoZIOyHIGwz2sRvKODcLNCtFfQF4Fw43ThW8Yb7SfoMF+IKG
	7uta9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w140p3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:58:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939fc317691so99126185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790758717; x=1791363517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCldqX24kRznYB/wd3GJ0ptCoXwDp+BFX6MP6pxs/R8=;
        b=ClMciLXi3dbEm1fyxFXheyEKurL06GwrTWhWKviaprztEgA28OJ01YiCqD8kAQZXUX
         7FwzKIIlQthtR//+8gImfIyj51203c/F+YPgZBn3xMjTsqsaKqWwHJszcQo3c1R7/2ba
         EdUUVu/4VTrZ74XkRUg0+zbZzZyGMRbUNoDi02c0tvD+5IZq3gKvmqTdi8B8JENuWv3R
         jTgDp3fR0gmRk34CvF1iARmKrYHqDGORSKGY9kjDvb3ycigRgTHecQtp6+iur4cJe/Wt
         tay8/3yjPSVvT9RLd5g19xWbdQcwaP8Bh8eU0J9uQFjiCnlIEn0OFdYOtSloU8TAPaVi
         c9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758717; x=1791363517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCldqX24kRznYB/wd3GJ0ptCoXwDp+BFX6MP6pxs/R8=;
        b=ddae8ntdsdYEN3LDnASreel31vooOX8rY9HHEmbAqBo1aLyr3PIvWEal9NxhaH+nx0
         2xC+mVBL5p7DrqucJr2zMUuTSj4Xdsbula6bBDhvGHVpN5nQhIr5vL1KRICMtRHs67lO
         yC0JaA9HWbzJruggr8Wtx/dXvitpkgstWNE/hUoxQavzIRJII1g4ygqSZIUJRkV0BVSa
         bS8eTGDxJLsM/e9tBaMt6Tsuo1GlLkk+eDWClAFEP8YWQ5K3r8x8S+OwA/Ln5pLYUIkL
         RyTNZ6uJAodFafgAEhUCBZLP8Jj1an7RYPb/8jgFUoH8eoXibSWGqf7Np/h0YG71VHoe
         2HOw==
X-Gm-Message-State: AFuF++nRcYvnTecZChjxVz2QLVvCF4iPwEj+43Ply9J86VGsOzHB8dnm
	wdcdP3cudKpyzZeGX6iMjWh2bUzX580WC0/tKW5HFuVVOWc6hym9e1YXO9fkISX7DUcOaFZLePs
	QrQJfErRhLEUYB4m1xfvi79DmXMUajOyGVM0JHYYpUqOlCuRHRRcnKi6+KLM7pea6C6yO
X-Gm-Gg: AYBFou0Mo4xgLBoA6u0lI3DFJ6JAQiuC4Iio1fcuEupCWBYARZI8ejyxhAfhPeSZogU
	03XHlnBavh4EG8TzAxuLuE09wytmsx5F7XNa4IYPQwX+4QxLwOQFaWeIy+Bp1e9Ssy228m9Geif
	KljzL0SHo3yBBKXiL6I4vogEGsqszn2v5yrwNbBR62MFa2XWmOE3WcXQBtGjiCxW2rFfyaLkpRA
	WCAzYume1bky+hsLzYRxk0JDKIBZ92J6M4r9TAxlSOuPvVIzWPBfsgO56UwrxnOC7wzMEZaRIDu
	hopTFeHmzYMgtubZ07JS3mdtz1xQ5aotftSoeoPL3tFuFJ8xD60GDUeIwMznJutHPfdHge3IGW5
	H/f7vM2yu/kCNT+yIz9Bu8A==
X-Received: by 2002:a05:620a:370b:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ca97a23a9mr93903985a.5.1790758717405;
        Wed, 30 Sep 2026 01:58:37 -0700 (PDT)
X-Received: by 2002:a05:620a:370b:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ca97a23a9mr93901285a.5.1790758716949;
        Wed, 30 Sep 2026 01:58:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f803ddsm31029066b.47.2026.09.30.01.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 01:58:36 -0700 (PDT)
Message-ID: <647d877a-3b47-46bd-a5fd-9c4f4ff11dea@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:58:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-sdm660: set num_parents on
 mdss_axi_clk
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-sdm660-clk-fixes-v1-0-5d5bb84e3258@gmail.com>
 <20260928-sdm660-clk-fixes-v1-2-5d5bb84e3258@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-sdm660-clk-fixes-v1-2-5d5bb84e3258@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX6Cu/Pc74Drpn
 txaXtXdDYWQFYX5gC1fUjkG5AekhSSTd8CylWpydtoa0y49pMP9zFsU5rii1TYAwNkkw0X/iJIO
 VDsVzqUoVbnMGPW7hJRpIp6Sh52UY5Q=
X-Proofpoint-GUID: o4acoya6X4Tog1rKGapXQ7pbI58NgCRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX6OuqIUBE1CTL
 PspBliaQKYuKo3VvK3kmzk68vGSc5MxQC379JGY7C+Af84dQu8Md20jFrUxeNhNLyAJHTypOZ+x
 ae0376FoVY/7g3/sZCkqJxzbssZbzGwC+iZAHCs4362yIO9O9x5DKmPY/aCSaRIRK4FMj/loEcC
 Rtm5MUwl0T1/k8D5NzVp2630OEgjzdQFMPNtuC58gkp0x5my9gfCWA88v7IYc55OkwaMSIXM0V3
 QQrQUz84wU9O02j4TNBuIA3VdGI5tkmmEOVf3yEKO/DU63v7XEo8n9GWQO69Pg2MviRbfj15j7v
 cN2FMdLpRPBZsrFIhVembpONT+ZY+q6DehsvMMaSb424weN9JwyXwRKNM5qKnAFSute358v8Ckw
 QfmK/63IVnEHr3Dv1jE7MxzD9YdSkdwoIGtDOLWcNx6sqptV/AV2pIAhWfSrhGdNqsJH+LJU+TT
 xwDqZmUbccL0ngBE8mg==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abccf3e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9-MLHjcu7MZYho5Sk30A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: o4acoya6X4Tog1rKGapXQ7pbI58NgCRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300035

On 9/28/26 7:41 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> mdss_axi_clk names axi_clk_src in parent_hws but leaves num_parents at
> zero, so the array is never read and the branch registers as a root
> clock -- no rate of its own, and no reference on its parent:
> 
>   axi_clk_src   en=0 rate=384000000
>   mdss_axi_clk  en=1 rate=0
> 
> It is the only branch in this driver missing the field.
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
