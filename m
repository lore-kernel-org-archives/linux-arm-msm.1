Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481854;
	b=cJzMgVI47Q60/9wlRs0XthPGfBqM0PtX65wzSmS6gpAWnEYm46YiK7QQy8sT4eTNllo/
	 Fp3+4d1x1y7TwAXddxheumQzlCzrqv1BMxemRMJc5pNoIuxmuEbXzVLWl7N+bX1ToHlam
	 Qymlta2WemXfBMeD31tHhmoK2Q1ISUU9GHVn4vaWsdmfZzlHFVH/GVagtWEnWaKrI91NS
	 EBwGCfP5g+L4tZ164ldaXuW44V1qvOT/+2M91Uh0UH3Fp2y0LVMOfBe5u9KT39uNgfjaC
	 6EaIrTmNL9ZekKRNoVF3AEwpxfRVEXLkA/I/HNewr8E7owGtZHOwZmVwSFJwSvpeZcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mKtABXtxP4HWg3m2oaMjBY+ADs0tjjzCm8Ghlcjiz9w=;
	b=YogC3++tDM4RO/XXPPtXnfNxfhJxxpi6YdrLZ+Z7Wzz3+afGDiHoLbSNcwcKQMsTITqv
	 glhisGclhgmYWHwB42uGAN84H4/FZwbSlGK7UOwQMT/WCj7nOK7aMLAL+m2DHBr0kPmZx
	 z9HrHgAAtX9h4+Ek6VZSps83OOQID0f+OR4er2Hm7FsEjBMTvDlA16HHnzGcQ/GHA3d0h
	 t4EC91+rpYQknDAEySzV/w7gNoq1RMnMe4guXKAc8oOUAaTlnFHsxzBFjrKUkSpquaRry
	 sP+q0nxmxJeZyMDsVG3JBSdauKT1NUhV8npT+9kgif+pOlOyXjEWQPLiODwzBMG2Nww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eJRNfBig;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QuCjajyE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70405606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70405606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eJRNfBig;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QuCjajyE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7jn3806851
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKtABXtxP4HWg3m2oaMjBY+ADs0tjjzCm8Ghlcjiz9w=; b=eJRNfBigwgWLLhow
	6Iu58sECqJOnk9BgRoZ6Uog8Bsspa/DeTvKYWjX0UO1wXHDHKwHVxsLpvr3V6GfH
	iJt1LbcdCfd+kxR1JVk/lm3vGruIj+0D7V+tdZNO3b1n7Ah/Ji25C6rv/Y9E22qt
	qlgPQVEDn02lldWwTt10i2nU5jNnQxhB7YU0QkOxVXwu3ektPr4K+bssf3BELn9x
	hFwLgxpzJHwOs90BJRyJXHJ+y1Hpuh+CCa0w331ZT+pv81T8KL313EzRqFkbJBEu
	IrOyxKutnSXecH0bl1igLVFL6ef9OfzmO9Ngq1KSYsP58qz2/EAzpPgPsuOq4NfL
	i5DC+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9dxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:37:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so58892085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481853; x=1793086653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKtABXtxP4HWg3m2oaMjBY+ADs0tjjzCm8Ghlcjiz9w=;
        b=QuCjajyEl8v3G/F5hwU67ohTAujuav54lzet79APrwj5IXqyOKwp50pgHkKAhvkJ0p
         kxx+z/pSQ7vldd4103dd6T8ImB1BOoCZ/54bHQLYtAjy30NvHplLnV/ySxGK2vCBiaQf
         yA/AMKzO3tEAKfw93XS+9uaNZ8NmGoi5pgSA/+BzkhD23ZwIv6DEkYryRUPsfYAabFHm
         Lst8DKk58CzUFQKYxTTQ96OjGPJyZYDuMEKQr+kgg8gMQDjLq6snyJRb9aGoCwD0J8N7
         bGmZl4NuvbTLTyAmahUh7XY+qF1GvQ0rY71yGh6KZt4Jh6iTfveJhpUt7A2eu+0L6MFh
         x3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481853; x=1793086653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKtABXtxP4HWg3m2oaMjBY+ADs0tjjzCm8Ghlcjiz9w=;
        b=238Xogb7LgtxZA6RCjpR3mBcRh+w8eT2tBXJcA33gquYEOSBM8263bk4iuoWEYhZec
         5XDNxFHs099jc6lt9JtLtUoDuFc6R5ocSzYDPiR19cu1H9Nw3zN9RbQ0fLif9mt15q13
         oNY0crhV8yDXwSTzoHIZ3cHTfy6mUzINN0zWcYBsktF5W1Tf1kw36WCI6vs21IBOwhtf
         eei6yOmLCGV7/TDUODsKC/1xnHkcbiBAioLgXI63c8v4s6Tzw8hfr2lUgJPolDwzu0it
         NHZ6XlGkU5mJjId7QtnZ2bH+1SoMEkjwDtRi7umLZGJFFU428YZnfDsy2zInGe7EJF7A
         dQYA==
X-Forwarded-Encrypted: i=1; AKwUvBx9xNKuANhf16o75SPITFM3pwXxYoBrsjihJX9yjpDhU2VNqGwU5YAM+k/o9ubJZdNCpHVzMKVQkYgz3Ac6@vger.kernel.org
X-Gm-Message-State: AFq9FYIXIg1Q1vSGWMARR7wQb9TW9opmOf+BFn/dnfXLdp520KiWUknx
	FbvXq9BkJ1ZCtotAYLpG1PEL3ABXvJqvhsYohm5bg62Td7j44D7U9UgcSrB0M+QQ9IVTSCHeofj
	dr0YppvlxMea483EHgl/vtxccOFE95mEkmRDD2MUGkqQA/1n7+v661OBjK8VHx8Ezlb9z
X-Gm-Gg: AYBFou1Vm6oNObtg4O43OKV3mUP31bIGMkZLyHmrvS/0FxZome0X+Qfaw/MrOr54K8N
	+fz6PDffVakTknSuT26yQWvP+72dnycvZjz9XN3Uw7f5EdTIHu+zMATmQRy5QToK2paAifLuhh7
	NroVkATl3YPFwNErvqxnx6CEnVUMcrcJuKmMi0s+zQZLpyO+Je+hz9Q3ERvcAwaiy4gidsaKHEt
	cHZOF2x70p3PcNKMJoOdoldoaxke9djJgiL/sW11/7IxjrlUrkeQ94kD2vPO7gU45EDpABoIIqD
	U8sHjylKshHhjF8ynw39VDjzC79izFmWEbPvqwJc+brHUatXyfPpuhs5fa6G/CKzDKgvZEB++8u
	PYSx5gYq7G1AO9ZXaLmmYiw==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2016479185a.3.1792481852723;
        Tue, 20 Oct 2026 00:37:32 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2016476785a.3.1792481852246;
        Tue, 20 Oct 2026 00:37:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091fade41sm450043966b.82.2026.10.20.00.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:37:31 -0700 (PDT)
Message-ID: <101257b5-7e43-4cc1-ba17-1507dad27b52@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:37:29 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression v3] SM8750: cambistmclkcc + camcc together hard-reset
 the SoC on display blank
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <179179331695.677917.11557670447411700010@mail.ustc.edu.cn>
 <179185039667.309517.8503800087166757122@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179185039667.309517.8503800087166757122@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TQucnr6Z0zctpJFyC2AnlVri-bAtVpuh
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad71a3d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=0GgPJE58b56IY-fw_GwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX1iQjfZZ5y8Af
 lzPjGi080LqQjpxqx95Y2unk3KlzPSfHFIf9MXDnQtFbUHRWXh8vCT900yjxwR+iZrpcpFayBJl
 aGWvWErU3YR+S11iXqQ9KqVjC2GJTUUHeEZiU9eFAt7detisttqzqJ88wTi3schl6miYKbs8elw
 t9rWumBUNUP++txYLlOTMaF9SX2XZCSHn8tEuwc6DkiQR319kKR+hParHKX3pmJkUtubFQ0z9B8
 lqpykVVvIbaEpqY9xZ5muDINMSqIx17g0SuR6R/hDtn9aI0vvjET4mnNoTZmtU5XI7i3VmZM/NN
 6jGfBVhtoYhcvsouzc3JdWoa0ZTLG30zkx5fJnBGXsOIuYY1CuftSedbMIVM9Jkz9nU1wZRwZYW
 g5/SwijujuC7nnpzNC9COeArcVK6epMFXPPrukkx0CgPjTcwm2XmiG13O4BzXWuInvA6r0HLlMP
 40NOdNN3rJPML+7dKQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXzy/j7MAMWDDO
 ZxnNl3yWDJBgHUCP/hQLcACgo0ityiIgr/gnzECzSFXjWdtmZbq4j7wRkQnBPjTqA9fQ4dk3BkI
 RXrt6318AoyWSzaf9o1wJrJWP+mfYpY=
X-Proofpoint-ORIG-GUID: TQucnr6Z0zctpJFyC2AnlVri-bAtVpuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 10/13/26 2:13 AM, Qianhui Xu wrote:
> Hi,
> 
> Two upstream data points that look relevant to question 1 (cambistmclkcc used as
> a bare clock controller with no consumer).  Short, no new bug, just context:
> 
> 1. The Kaanapali camera DT overlay (PATCH v21 14/14) uses cambistmclkcc as a
>    camera MCLK provider:
> 
>      clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
> 
>    So upstream does have a consumer for the block.  On our SM8750 board the
>    reset happens when cambistmclkcc and camcc are both probed with no camera
>    consumer attached and the display is blanked.  Is a consumer (or the camcc
>    side being powered) expected to hold the block in a different state, or is a
>    bare, consumer-less controller meant to be safe?
> 
> 2. The v7.4 clock pull contains "sm8750-gcc: Add CX power domain",
>    "gcc-sm8750: Tie the CX power domain to controller" and "dispcc-sm8750: use
>    common probe handling for always-on clocks".  Our failure always ends at a
>    display power transition and the last RPMh write before the reset is a
>    cx/mmcx level vote, so this looks like the same area.  We are rebasing onto
>    that work now and will re-run the pairing case (camcc + cambistmclkcc, real
>    display blank) with the same three-state instrumentation; if the CX domain
>    tie changes the outcome we will report back with the evidence.

Try this diff to pin all rails to the max state for a test:

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 4d9463b4d5df..eb410587e286 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1274,7 +1274,7 @@ static struct platform_driver rpmhpd_driver = {
                .name = "qcom-rpmhpd",
                .of_match_table = rpmhpd_match_table,
                .suppress_bind_attrs = true,
-               .sync_state = rpmhpd_sync_state,
+               //.sync_state = rpmhpd_sync_state,
        },
        .probe = rpmhpd_probe,
 };


Konrad 
