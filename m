Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE9401A06
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976677; cv=none; b=peBI8PB2OBC4928rhVCS+QMAYJAECDmJpgE1eAfV7Y18EiJtdbb/3abpjAL/jXOemnbIl4xuMvfxJrs4DxjDVNgJC2p0kgr1rJsC+zdZejCRdbX3ID/tvkcUstGIHptOSmEMtJC9w3c7R1V6qOp9ACRNOQ/zIQAb/CgpnNH/SCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976677; c=relaxed/simple;
	bh=+7yfm+5K+VZQsyFbiUTNCJn2f8ksir7wnTN5Wmf6twA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1H6tJAdkzSyQoqul4yuaJ31bwHXsZQxKM+2OBjyzsaC0Rtav/8WKRQyCyZun9cau4ERrnYkqtZy7HYaeacEbxJPHf3CYdPsHdDJ5U8YYzcUm9WhrBcpBHGIRDSBghb4QTr2hxe5YABWUIOrEeFC11LYilKdayeXi4piwhQb9BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ddpcl4mc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPEdQhSC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ddpcl4mc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPEdQhSC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5nIX3454588
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gx7F2NQ9w/yTqv0DKEXValIPWbDUpRWua5sFLuVQhP0=; b=Ddpcl4mchwt+ykJQ
	yrdMh1ceg4e2y0HOQFTEbRnvwST41OwFtT0f0vlO/nd8RBfOMwkqmnETINAaDHpv
	wBJcnq+kZcW2eF+TLQirkSfv+2WpAnnQiWpuJfxv8mXN3TD1GcRzVFHBo2UytjZs
	qe2+K38OoiCNAHCPh7s2FFvwZMmLmUxuJ5nbyzbD9F0pRRuYXswwQ5LvJDwdYkuR
	NUOo2sag6lJROX36gLVKlSV/cSDy7mrLiOzqvyUyJmoh8t+eNljY7i6MnG0V2TtS
	QhH4AlklwSRcR+0jFd+vCY14tpJ5p8yoGtplVBG7eRqntxCxdzL2U5EYP5we0RpT
	75Bo5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7ks7gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:24:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso4296521cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786976671; x=1787581471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gx7F2NQ9w/yTqv0DKEXValIPWbDUpRWua5sFLuVQhP0=;
        b=XPEdQhSCuiq7gv/E2UrYoi9SBUmiIgH+/HmAedoDMx3uJOqV3kyYuOriA0uz8xve/6
         CFKPN3t+w70SDmhbcBQ/xqlzucSIbmk4xgui6A5NaMfl3iq+m3mOlmK+y7B77h38Ag+7
         EaE2ok7qySUBBCzzPYAOZaGGS9X8TWEYP+idloAwELgbR0KLnj2fmRwRwsT/N+gqRmdh
         TMEqit2XTLWCtAWv3zVUE0F/aTfoCC1fi2TMLP1cDJHGT6aRlvTRud+llyRAxZ/4C95j
         HsQoLqYIZrYDJLb1uy10/TMebmdJ6XfbdCQ+I8YNkFXAQjHMFP2eXCnphYoAlOzTzaQg
         IaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976671; x=1787581471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gx7F2NQ9w/yTqv0DKEXValIPWbDUpRWua5sFLuVQhP0=;
        b=dcCziyhuVYm0/zxA/atAJbz9MK5lorwH9+aXn/1MgsxnuEX6xRn63J8BzmNFCUjedN
         FfTV0kLnlTA8Zh0r9eRVi5bYIZC5nCV2RTKrp6c5AGm6L/X4T/iJg0AwAiCwCRqdg1cF
         ubhJqM5aqCvWI3SHIqYSIM3FMKY3h4Zy1uSuA2eq5xwycVPndAH19c6BDwyrN4ZY+ccV
         MKFf8icwsGZ4Pa9/qyAT16rDS3pHcO9X65dnYNxUjZpRP+xavPMLJahNQldkHkZvWdd/
         ShK9n7qa+esUp9GuArzgMn26volb5VVztDkbL8D6wvVT4iKkRYdA8ZZnArOjVHbOEak7
         LzRw==
X-Gm-Message-State: AOJu0YytY4IVFaDzctqvhAeFLITeWt5vhmq6jJDgEk2oDfTi2mPZGPIp
	QL5E6jwa5rT9Se085FMlqRZaMvrBn6tF3i3Kyb6nPKf/1DWgXyXtU5NpHzpy4DvD3BRn4M00w3Q
	AWLf9yzwtvhfNUIDlQGyFULinF2cOTPZA7vV2bDPzLMqppEDw0UzJz10/A3wvkzs7WaXl
X-Gm-Gg: AR+sD12YiOLZs2lhBD/nG75fCLoI6Sf0RT3m+2pbnRG8yXY+bPMcYTnjAhZNE57lkbV
	o3xgzZPLkHtoXQUJkfiT0wrV7ET2x1hj6jjz7o1mJauHrWeMyVXJjtZqCWWye5tnaJ/88N24PJq
	IcJg3xGtERoBDPDFwKrbXtG1yuU/62z1LG8IRC07E6rgicAUV8dKy+yxSamZGe7v1UjDQQojCe8
	3oEXXpEsyUWVCN33xLyuV5fsbkin4ZXudXFPgrJ17MwMHHTyAMnJrdijERl5sJjdCq4C4PbJhU2
	URRHNj8V7lSSdBnDz1/vM5f0TuwXzYL0wwN9lCyh2sQajYaOtfKqXtJQ5h1M7rR4isARtxrySxl
	L4PdZcytVBzKFRZS/v4Km5G/i
X-Received: by 2002:a05:622a:2d6:b0:51c:2101:f0 with SMTP id d75a77b69052e-52d8533db8bmr197486171cf.2.1786976670936;
        Mon, 17 Aug 2026 07:24:30 -0700 (PDT)
X-Received: by 2002:a05:622a:2d6:b0:51c:2101:f0 with SMTP id d75a77b69052e-52d8533db8bmr197485481cf.2.1786976670350;
        Mon, 17 Aug 2026 07:24:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217feb99d4sm66725066b.22.2026.08.17.07.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:24:29 -0700 (PDT)
Message-ID: <f8dbbad5-49b5-450f-a74e-5859902b713d@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:24:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: qcom: cmd-db: add reverse address-to-name
 lookup
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
References: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
 <20260812-rpmh-timeout-debug-v1-v3-2-68c0a40dce23@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rpmh-timeout-debug-v1-v3-2-68c0a40dce23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7Kp4-NHpadxlisBQ3RRhbok4JKdHoaXU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExMCBTYWx0ZWRfX9LyBE1sgmzwH
 kRBrsAptWCgqR31D37nDt6YJDdjPilVzZLp+YlVWVZkogIKLdLZ8PjLoDlBVyI63HE4ZibRJLoP
 r50XHUKeSNICWU6Q/PEh5n0KLoqPxhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExMCBTYWx0ZWRfX9SlGg8v3ZwiF
 v0nFKLbGbVJMM5yxQEdaLfa+H4dc7sHAvd6mBx6/sO4lgmVgUOsPivVQFHfzQ9Ra4F9b5PnGWIt
 7peaOMmk99B/9k6QX5ozAD8m+1FNbOz0XmFECot1Yzgw8Tu7s2dG38r84dThfv4rFG6hRdouva5
 y1yCkKrWnvDunnOG9mNTKUqo4Ed+Nogm34rAk1YqcJ1TNI6qPnTws2WN5ITj7g2tVTEUGSb0F6C
 pdEZMVCCkP740x/L4ZRledCijVTyCllMkj7zaBcgE2+vyXshQJsiBbeRK9JEKI5jkZOYpUvrvEr
 66w3UIX/N+Hj8gyCaptNgghcMNNVKDQTym0CTGgUi+wyS2uCkoQjrb0pmvUomknOdFs6GIx9ZYW
 YUeXsU8uUktujMSJMCC404HADyelQZownvXjfg7uIR05NzYdPnFGzvXH1LjEcW2bKWLs3/4DbBz
 spqtPhBZKRH3U9fYWSQ==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a83199f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mXvhL1AVVtzIk_KeqgUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 7Kp4-NHpadxlisBQ3RRhbok4JKdHoaXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170110

On 8/12/26 8:12 AM, Maulik Shah wrote:
> RPMh resource addresses are opaque 32-bit values. While the slave ID
> in bits [19:16] identifies the accelerator type (ARC/VRM/BCM), the
> lower bits encode a resource index that is only meaningful when mapped
> back to the human-readable resource name stored in the command DB
> (e.g. 0x30000 -> cx.lvl).
> 
> Add cmd_db_read_name() to perform this reverse lookup by iterating
> the command DB entries and matching on address. Unlike other exported
> cmd-db APIs which go through cmd_db_get_header() (which calls
> cmd_db_ready() internally), this function iterates cmd_db_header
> directly for address matching, so it calls cmd_db_ready() itself.
> 
> For VRM resources,
> which have up to 4 contiguous 4-byte-aligned addresses per resource,
> the match uses VRM_ADDR() on bits [19:4] so that any sub-address
> (enable, voltage, mode, headroom) resolves to the same resource name.
> 
> Also export CMD_DB_ID_SIZE so callers can size their name buffers
> correctly without open-coding the magic constant 8.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
