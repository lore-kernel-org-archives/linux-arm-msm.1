Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED8E44BC92
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136450; cv=none; b=Xk3J0tXVf+l0G1i+dwn4DGrnGdJLRIBV5wl9/ig3awa3mO9BQEeZFZ+pOpjtetvPJl6SjptHoqqf43LKqJVy5g2AbsVaAk4N0Lerf49U4Ps4hSNNlfZpq1hFE6Ns6ISiftYl4ZP4Ld1LYYq9Ecwg7zRqS895TjUMeZsNXfPrLX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136450; c=relaxed/simple;
	bh=hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g90QeBLlVdQkSX7dparr1JtrsMOCDxe5/7w0fBbkG1md0611QRKVU/IbV1NtgnJaqXL5IOgs4eTGi+SpL2d8TC7cVS533HBHxmlGx+/h3fr0hADxCC3trWwzRoDYpjSrn1zocd8eyUktMyOWZsEI0D9J4p7wTxP1AidHGhr52yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw84kX2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Taew3paG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw84kX2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Taew3paG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7tkS2947340
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=; b=Iw84kX2TmvvmjdLs
	1F0oqU0yrS/WAieHY1cHYmFOdGOSqSh3qVRb/yRQ5n2YrcpK5CnS8n6QNcTjvspM
	Oxn6GrqBl9XRaV2q+NTwDwcOVQTm9lw4zcU6GAE8qPsqmS3WIeRt3I7oN/IOaks/
	BbqMMPXkI5N7+/DrCTIBxF8m3z/9qvg/fPWr8g4i8jtSVrbJRZfdD9t6tYSzHyoC
	qIhh0x09p3WbLr0rxc7r4zTUl7WJGJncmN3lq+xEILN48zprC4hfxwkswWVp4N1U
	silnBqcKoA9yYgWOu6HiO54Twz0RhdGj3VL/gQqexwNON2nQMukw5yia7h7oMYAT
	uXP5aw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkasjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:47:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so1504781cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787136448; x=1787741248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=;
        b=Taew3paG/X26iijEfxVHuRGAGlz0qXVXLnuHK5Qh1rVYCns8najF6jeThwtP4c7PMS
         VK9a1RxB8pqC3g2I70esgovUGi84pdNFDiSOyrYR+OkLZlvZMkwmEjqNOcb3kZFMhe//
         eGWG2bbCshOaBE1evZDQGjN20vHBQM1FHam6ZVamMpvSOpJDI62xe2Hz5i4racruka9Y
         LRCATRXZOG7g27b/bRDSTSi9o8M22urUZqzGCeys+kXMBT9BEg2pM3t24sZHq9cZSJgu
         GCgnhO25ekRX5kFlSjF2N5P5eiIufTdmBoPk9VvCz9DQs7P1pL0G05oLnQJbHUknRskN
         9KPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136448; x=1787741248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=;
        b=p2t2UT2Yzx/jQHPHfShezNXDPkQd2/KsDTNSS5r/Xg5h6yYWQIkHskyEs13i9Gi3zG
         PChxF0kjd/HHuhMSMiiJ6XRft6pA6N9vQEu7Eeesg7rz0nw/+K9vzzGrdl9McxU7g7UZ
         Lv5tT/eMvdoeDp/x3tUAVRq+5HL1UXU3q6ei8Kp45Mt5VUTjn+EAuT46ABjfomYsVlir
         0PHXPqiw8QhmsAfP0T+6MMbdv8BJaaSEv3Cy3sCNBzVY/1ozh8iKVdEOzCx7lkCWztE/
         RIOKwlOVjIptCd+4zBQbL9zpFUL/aUVctDd9JN9ZJCTMVIuf7X324550cs2A7OkdXY+F
         AhSw==
X-Gm-Message-State: AOJu0YzrCHZanZlTNN6hi8SwaiNynE9LoGtR82JBHD7PCw5azzwO+Y5+
	npD9fGL1CBBsxoFMsP2D81exwedj30eMJvrTleNRcGfSx27jFrTR81t7+f+jxusEPvbxmlCwEG3
	eWgVv0j1x5MG7NWce3JWqwkI9FZWp79a/0NQRz4OkFkXF2OyWABCvSfsftCma0xoiqat3
X-Gm-Gg: AR+sD11dlxf1c1PsI0zo1UV2kFqRmc2B5zRl3UNeFJcVkCkfpyAzxrgdI5sHZ2sYOYE
	j6hvMiGX9CUB8tNaNCMgFrRV9gnzGelhXE1anvh+M27pyiJDRcNe/csdFnuCplmP8FMM8H9mSg/
	93RRmVdIxR6CS+YW2RBitZ3k5CC4Gw9tWNUaQ2ALeGoDtAkbkuvmCrxLVgouNYkwowOv4nHcpil
	+WvqlUvep+ILuxwvFi8j8dKfQMEY8v1KhWEToFlwZCZavw2v6wpPqQompYeEJuuRUTblI0Wvtpg
	iXYAjB/N02i5ni+m4S4My2xStThr1Wv2z31ClTxZpCrZsctM6KwoLTDL1GB+1HRYaa1+P9eaawK
	pWMwihyjFxmNaHpuv2Hid35+Z
X-Received: by 2002:ac8:5f06:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52dd61a0e2fmr23786291cf.5.1787136447708;
        Wed, 19 Aug 2026 03:47:27 -0700 (PDT)
X-Received: by 2002:ac8:5f06:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52dd61a0e2fmr23785981cf.5.1787136447287;
        Wed, 19 Aug 2026 03:47:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1780c9sm658119a12.28.2026.08.19.03.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:47:26 -0700 (PDT)
Message-ID: <3da25205-60d4-46f5-9efe-a97a5a6908f5@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:47:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a8589c0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=cfD7LCa2rqpQZjTi_hYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfXzuQDqPETp/ic
 eDsLAlq1IKwvNlvVwvCUzXnIiWobDv1lJM1VbxYQ7LhpT2kIkGYlBv1O94um93MV+WQc/gJv4Cf
 fQyxG05SwYoaLmmEIWH6I3QN60sQg5nxuMjAvTJsBPPSjW0Sj6JZ0L1AqKdKnQjlhQDcxyGh5IB
 OfjYPoUWWgnSYDmQZNuBtCl54RD338FWHJOnNqttuTxowlrqXql2DksLLb95vncZ+pzlVFQ+0Vh
 5WLisfrumI/l2qgSVzL7PYZpxT5VCky8/X8m/b4T6YWkdGPwQa7+AfkY+zBtgEBJrwwnW2IFicE
 BvOYbqeX0/NywnLfBVuYaMeU2cvqRkuXTQuiQaMCJ9+qjNf/jgjh20g/63oJs/bHApcFsw38Z3T
 1av7cO+23BlOjMehorrcm3zDrTaB3VaD+DJqKqdl5UgUj51ruTTUltlQ8tSJPbZEj41fNtI/hcn
 70b+E9sE3cMpp6fuD0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX8y7ENdxWOesG
 fsnnouB7JoIzDcm8Uo80RFFjvrj97TMD9xi80bjYywcbt2S96barZxtjhc7lxSLmi07ZODP7JQG
 HM3qa/looReiyV15kr16b028/1ICZE8=
X-Proofpoint-GUID: OQRheIGaHr3Zu8m7Pjqtg_SYlRPIbP-D
X-Proofpoint-ORIG-GUID: OQRheIGaHr3Zu8m7Pjqtg_SYlRPIbP-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190083

On 7/31/26 9:45 PM, Jagadeesh Kona wrote:
> clk_alpha_pll_write_config() in the PLL configure function skips writes
> to PLL registers when the configured value is 0. However, hardware
> requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
> for a few rivian PLLs.

Is the platform-specific, or requires for all rivian PLL instances?

Konrad
