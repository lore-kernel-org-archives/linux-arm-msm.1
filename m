Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774AD40A935
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198149; cv=none; b=dcjWXzlKW22y34vi3QqZzBTCE0ZCvEAVSmh3LvcQ9lo+3tix280IU+ce9T/y/9HyPXP6dFtHBK98wYkZZ77uNkmELu75qyACHrsXeAs9bUJKt9Ff5VJ2Af4WNb6Zhd1bfbG1OkuGiDNwEo+b54mvF0gjsJ4lL2dMVDwy9fWZ7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198149; c=relaxed/simple;
	bh=HgdOOrOpZHUf9I5DdxRuN2BDK3XTvOH3rwzizwiwkeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srMO3Y3xE9f+0pg7tX6TgGtPpypaTelJG+BCU+6A/GdRICbGkZ1h0cMxF2GARgfiZG4RyW7r7C+r4M9PcoQNT21CUkBTgtTQIO8MaBusP374Pz4QWQWvMrhfe9vuYB9FxslecFkRPQywR+IairfIPRmWvZ9pepR/2d9OT8jQykY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOqnLRI3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXylxRGN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOqnLRI3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXylxRGN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rEu23489518
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QZEMWTTDzBw1siRNZFr5rbXMLMu/6PJE/Oangtk0zN4=; b=jOqnLRI3+pvh+OMp
	YR1mZgI+iueJxL3ZggF1wCQIcYt/EOlaVl8PyAU8DGL93048+BGsju7UiHxtoiro
	2q+sNZIop+YqnnYESCxnFQltPNNZUePmsQlhx1dUFDscMTcBx9SxRg2eCc9F87vb
	x4tUHRQnasxhdL5D/UtX5PHk1iMQgRExIbMGvNo+PYeUMrjkVsg7WnMnsrGaxeIG
	V4BIE6TevPgu4+o+F8obdFm52BpGXXeBPWUnEiURQNsO3qenxBwGHTEYrnEspOzl
	Zs/+LggTqKG+rBdW9TYILXgMQlhcZaAJv/PGUCyBvZ/ejN7Ylj6N6nhQ1ZdwckOM
	5wftlQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3phm8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:35:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso3140383a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784198147; x=1784802947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZEMWTTDzBw1siRNZFr5rbXMLMu/6PJE/Oangtk0zN4=;
        b=VXylxRGNnl2oNTGyy/x3zfJ9jFDj7IVxLXlB54Lgm6geBMZATPlI2JrtuKrku7gGBl
         AlPxK+WJrnrTt1lS/dhSD1zkenJzQRmI7GGlgHPLpwgg/nHk/9msHenoRWfGfg3Uj0bz
         0n8uo1QvGC6qWRCsPu+za+nhJpSORmRsWF9v56OK4xnwto7LIA9S009xI7NXapDEXUMx
         ZfOEx/aj+Ni7OkqkWKibK3prfuaBlzD7ae7NyyLOZ/zXvb7B7ki23FVPnoaf2u1k8S4q
         9CAb5X/CGa3Qt4Ruj0gnD5zrODz6Lz+kqQ+azZBUBaVXvU0AtO8X+VHa2gU9eVpbqJvz
         RcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198147; x=1784802947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZEMWTTDzBw1siRNZFr5rbXMLMu/6PJE/Oangtk0zN4=;
        b=Br8Iklql4xHkuoP7r/dbo+OB/3i++L8B+6aEh5QGS8orm1CtsDNXzSUUA8IBvlJwyM
         abYBb0wSdux9mEfHq/FPVEh/1Na3B7+MIOvvLmwbLZy87G5qNFqe5Jax91Rv3t4q1+I/
         DAhyMCspPWEhO3HLlQdb34uQehQEusnUWLUmO/fo4Fh1f4lKpThU+UIeUWYp8sOjJJsh
         5Z+PzCQsLR6ZJ1uan9bwgIcerW+ruUSul7R3Reopf0l91E4D8W3952VT7Nl2Jy9P/VJl
         vQTWJGd2K200aT4UYKDEoqhm9gFCNOaccWVSEnAS7MImToGk8MIB9ciAjlIOete+2HdQ
         Cq7w==
X-Gm-Message-State: AOJu0Yy6b981KeOmoi4/ic3vkCPQbBGjHnDEbLEI7dsxDRl+agOegZ4y
	3tlmJxJPX26D3uCmTipF6wtDW9dfJX24NO1DnM5TNtEf1mq+yKiV6SxsJ/enXedk8iTvYKqSj6z
	JTrdihAiSiEb0hqTcuvoiN16JAtEBUacpgb14KbCAe8JKT52biCRzzigydN4bli7eHZGL
X-Gm-Gg: AfdE7cmtfJFPgTnc6s2yIODDgTPA/VwI+OsgMmXQTuOtV8t1hFXcDyw4ZJ3YVodPCVk
	kj1C9emvokmb/eW+rLUaG+XkJ2KPdFP4basKMsWpdtCLfAvS9BsHS77iQ1jn0frf9FCm/txxQH8
	8Ej17J6LMGaZINlQXmuFgv5vBSBBIkHF+toESwF9lF93lVgDppmnrF4xVtzdrGKGIuf5twje2Q3
	LebSm722G378AHUjX/2f8D+rvzHaxsp5ObPKLGct14dKhpma0/cbOaGCfeS+8tUTkaUohcevEKC
	XbifH+utqxbZTUOLWKkpJyRgYh7uiOACfMGe39zHj44oVAQr5B5f8F59na/OI2fKYo/CbI8uHcs
	yKTgcDJ13ch1Wlzh0AQwXdJ51QVuSUm+kREM=
X-Received: by 2002:a05:6a20:728a:b0:3c3:8d4c:6679 with SMTP id adf61e73a8af0-3c38d4c6cc3mr2120166637.20.1784198147045;
        Thu, 16 Jul 2026 03:35:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:728a:b0:3c3:8d4c:6679 with SMTP id adf61e73a8af0-3c38d4c6cc3mr2120134637.20.1784198146565;
        Thu, 16 Jul 2026 03:35:46 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb259011ad5sm1593042a12.29.2026.07.16.03.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 03:35:46 -0700 (PDT)
Message-ID: <02231fbf-1f8d-4a80-89b5-20c05c09787f@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:05:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] i2c: qcom-geni: distinguish address-phase and
 data-phase NACK
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
References: <20260716-fix_cancel_sequence_on_failure_for_i2c-v3-0-9091315a33a0@oss.qualcomm.com>
 <20260716-fix_cancel_sequence_on_failure_for_i2c-v3-3-9091315a33a0@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260716-fix_cancel_sequence_on_failure_for_i2c-v3-3-9091315a33a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: URGF7JUyB_L0ZbLMT57KHhVvEq8El5_X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEwOCBTYWx0ZWRfXzeCW0obsSFWz
 R2flN5/cuhA1N6nGA9KDktwd9cFCifBwbypmNbxWLALG1sbqLyxc4X9d2BCieppwsJreLEL6jD3
 mTy0U5OOCh0i0YN/1Zl4O5fjrAoOoK8=
X-Proofpoint-GUID: URGF7JUyB_L0ZbLMT57KHhVvEq8El5_X
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58b403 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QTIInl-oKmcOnA4cS_cA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEwOCBTYWx0ZWRfX67Bd/yzZ5R+F
 B2WucFEvTE0e6g2BlavTqVhpmQNXalANBvUBAJtdCkz7B4gin5E3NAQfR6Lz2zKatrgsCiA7MDp
 mQldVzvNxJb6KPC5vNMmEDoYy7PThkTBdagMAC92msQKU/fg+B3cu4zIEhNWsO3iVozhwipUi/e
 dVjKhi5PrH2enSfRcnUGy2/433A36dvY/TK9pNp1WLkSObBhg25wIAEzCXe0sBwZhK3w6oueBEQ
 Rnak6hZn65isp+jOwk5UXeldnTEgvFSi6fLsTb7LTMCx1WqA1nbvziH+KG8CYSsoZ8CMDcJLgBz
 bSQWkUeb5NpbZzBbgEaifOVqZaBATLcdEnoJVAelTA7INd3sCAhoymBAbteLaD8nTCjYyofBiBA
 U1kpY7cxvNk5APPZOF4KPciG+DkkYBorwpfs35J32csBICoHlcaGXqtWFLhhbssTQoZipQZiYr6
 4tmwiXvNJFbpT3O5K0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160108



On 7/16/2026 12:08 PM, Praveen Talari wrote:
> The M_GP_IRQ_1 interrupt signals a NACK condition, but does not
> distinguish whether it occurred during the address phase or the data
> phase.  The driver always attempted cancel and DMA FSM reset on any
> NACK, which is incorrect for an address NACK since the DMA engine was
> never armed and the hardware requires no recovery.
> 
> Add geni_i2c_check_addr_data_nack() to distinguish the two cases by
> reading SE_GENI_M_GP_LENGTH after the NACK event.  A zero value means
> the address phase was NACKed (ADDR_NACK) and no DMA recovery is needed.
> A non-zero value on a write transfer means a data byte was NACKed
> (DATA_NACK) and the normal cancel and DMA FSM reset path must run.
> 
> Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++++++++++++---------
>   1 file changed, 20 insertions(+), 9 deletions(-)
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
