Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E73E3101A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953052; cv=none; b=AskhtWg1JDqV6vRYf7r1LMxE0UwPSrqAfMumm2+WWGQUNEoiokuVR98A35DOazDZlWf4DDRSTe2rLhgyDpeW5p/XT6/1K3KFnZ2hnnI8tbD6LjCYQHSyYxpa1p6o7ED1kYvx6iVjAJDboc2FahS/l/DBCpbVnRUhPtANrww0d/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953052; c=relaxed/simple;
	bh=Hk++D4JyoolXiQ+tRRkmF1yo/R442jxk2q/MahToilg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUaOtXg4QbQAWhi2WVoUkgQNeE0x/4t2b/wUcMkJQuC3k098o6sXdBDyRc/KFBnOBOKBZxYxMI5IAxl8uRwDZkbpaBh642DRqoTT/0tNqSJcD7aG204Ym9gkyKllb5uPWL2y/SD6jSz06LNfyGOi21UcwyFWW2K171KcYPX25og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIHDhD7L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9/sVkzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIHDhD7L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9/sVkzk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H72sOR160949
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIFWPWWJnUZJjoMpA3IEZYfcS2vjGxguJ9wrbq4Ooeo=; b=BIHDhD7LzioNEiGo
	vipt9gQsa01CJMDdJQleA5PPgIzAxOnvn6U0CDP+mbH4hQCa+y9NfHNjFthGtaLl
	zFX+eskz+E+au5mpxO+aZ6yzenmAuavZMtsfVWfVvQSLMr3FJXE/bY9b9Cchq7WX
	bnp1KqcYUxWcFhkbgnpL41+V3Baq6wE8aj35LcHUEE5gegNeNCbjd+sLfCaTUdFK
	y94zu/vLC8kHHmuOev0nbDWDfkO/d0W3cAf7S5Fodo0bb9EPie1M1vHgplCGOgch
	ETUlrnoNWeyyDMDzY7aoKxANvZtc8QVoc9OTWG8rCixWbmA1ZeheENKl1cQxF0fF
	tkrmsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk5wmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:50:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso29630685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 00:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953049; x=1787557849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIFWPWWJnUZJjoMpA3IEZYfcS2vjGxguJ9wrbq4Ooeo=;
        b=H9/sVkzkiZh9/q3usHSBSCStw6wx+ovu9/K/fYQPIUTBpaBTuMGG2913CQ5tbV3ged
         XdY/YVZRnT7RYgzZ9xCRWyeCjG6j2yPD5QWDaKNhehZdkwml/BjQKU/xv8ggwB5xzQSZ
         N13/GfnxRIF60n+67KlEe63n4DN7yOWCNbpxucUCqCQRPstsm20DQzst+5orzVQ1ov3t
         BUaSNJ+68j+7p1dPe3vyiheT89rS5MeNfz2AsoBZoSwhAHYMHjbJlUbf3LT7+GAWdFzT
         xIoTo8omN5G5+7qvf11n6tRqTX9C5IJEmlQdzpg4i92Ri+rsU9KY2Yf90TtR0Na73tP2
         A8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953049; x=1787557849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIFWPWWJnUZJjoMpA3IEZYfcS2vjGxguJ9wrbq4Ooeo=;
        b=bZ66PzKzDdBqL0t9b8rlZKAnnXsmeIFsNB88zkO50AN3Fm94k1vxclYaldHVgu/96N
         lqQFmTiTjbScRBg9lbivy4jmtkGJzhnV93cVX81In84UU5wEqrtVWotWM7we5grmkq0D
         Id1cxpaat9p5Jl2lAND3dPou0jGF7jYZweDZELiVEHwYJJxXVAqrcg52FchV1aWO1/j7
         n5Dv2lP9qZloKzH8iHyJv/UTdyOlzUskcOcoZNoTBu+YsyNN15KQ5CJc56wJUGUeIH93
         GxjesaiAMDfOOhkEFNgpCbZk0xzPqPiQD2yGwaTDE/RzzxhvmEjyxqo6VcgLaVUJIRJh
         MmgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfLmlayqncC0WFxUeVrmggHcFoBdkY/LWebB/UGVEtYZsnV+rvrum09IylW3JIcefdhBoMqjeVXfFh5nIf@vger.kernel.org
X-Gm-Message-State: AOJu0YxRLGK5CwBv3AhFJE6KQeEcuz8izhh5YoarMfvkZa7K1Q0ncxGG
	rkSMaCTCP0fJF0kGOcVJ8Ky812ooVoC8I6MSuj90QV2G1zhxNATZhoVSDEJ1syU7DpK4+JP2NBQ
	HjextEgsYWgyRPpxzDw5ORiaAyJyi4ZMktb5MCne967TrEt+BGZ4+AlD+nC08jd2L/UXS
X-Gm-Gg: AR+sD13Wdpu0HXEAwisPJhuNG7ZwGpRg51NIzchFfIbcHerEgWtYG77gsLZbAWZAS5r
	PBbKFDUTM+OsJ1GKp/i5rqbzFPDmUXOUxdEMwNpoRIX33nNZwswDbzx74jWk1ZBYL1Cuj/Gtk4X
	cJg2MjCNukSnRDWcXV2Zyd0lP3f9BODBl3A1mFeJhhyJwwQP5HZI6o5j9R1SNGEnoIYp436Fj+b
	02lHIST5N6OMyhC9U9IaMbPg5sHwhus18q8JjMnqZYUM+rLWtJgZxwQLg5MokO8/ue+K16Nwbob
	DA6BNKlsH9PlL8015drouBG8EaEh34UXTaQzkIjdLlXiNDd3P6o7aMQlshbtHtxBHBQOox7D10S
	/OVMPhJWxsrmWH7jF2QZHiell
X-Received: by 2002:a05:620a:460a:b0:931:4c8:d8ca with SMTP id af79cd13be357-936d233ff1bmr1744114785a.1.1786953048758;
        Mon, 17 Aug 2026 00:50:48 -0700 (PDT)
X-Received: by 2002:a05:620a:460a:b0:931:4c8:d8ca with SMTP id af79cd13be357-936d233ff1bmr1744112685a.1.1786953048325;
        Mon, 17 Aug 2026 00:50:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85173dcsm314100a12.3.2026.08.17.00.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:50:47 -0700 (PDT)
Message-ID: <7fd19b98-1d3c-44ae-8626-e89461e208ac@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 09:50:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: iris: Guard the QCOM_UBWC_CONFIG select
 with QCOM_SMEM
To: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, nathan@kernel.org, imx@lists.linux.dev
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
 <20260814141724.1006382-3-daniel.baluta@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814141724.1006382-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX6P71lhYvsBbW
 YlzXm4rzl7NkUgVWXsat6o+w6pdFcx/64uawMmwk4T5yxLBTD4U4eH1+wo+F9wRTJxUipG0L9gb
 D9TjpKxMOffrNd2EwYHLaDr0hg319q8=
X-Proofpoint-GUID: WTarBTDvkM4ZrtWcq-5RXMOs3Ke--wdH
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a82bd59 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=L1AqNCugDRGGcWq5ZiEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfXy3y9zkMrwoYx
 8aBx5hPouO4mZkzxr4vMPJf8j4iYgwspKvFs0rTIjCe2Ig5zWyhFNSoKrrqYPJNuHTEFBAGWoIM
 YfoTDMtxoPE17bKY05jhCI9popJ4DPFsayBzIy4zESwb4PRa6RyaGuEjF5+Z1BjQTFmKpg1JT9K
 uJTRPdPu4nvCMi44eTOP6PBTk+SI7DxsnD6jzKADDZzsRwCNB6PFJbN0sCsEV1E3aLbilTEyx3x
 fW3rf/oj5n0AlhVdjJxb5FvJ8Sm92zXb6PDkD9WxWA40fkULArXrzq4tmHUSFTH+qvFYpnji7D6
 84qo8fqceb1I7J5jPu9vHhs4CeneJx6QzbRjMjsQDfSR+NskyF68rnGN6anbpubBK+zvKo6CiMu
 FXFI9+I3rtV66Eio/OxKu1/phrw4OxKtiDE1KtCVWOBf7AHWrh0jC8vLn8QAhT/Fi1nupxT/fjl
 Mrk1kEoEtHDky8QLTjA==
X-Proofpoint-ORIG-GUID: WTarBTDvkM4ZrtWcq-5RXMOs3Ke--wdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170057

On 8/14/26 4:17 PM, Daniel Baluta wrote:
> QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the
> VIDEO_QCOM_IRIS select with 'if ARCH_QCOM && QCOM_SMEM', and add
> 'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
> selected against a missing or modular SMEM.
> 
> Fixes: c43207553867 ("media: iris: retrieve UBWC platform configuration")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
