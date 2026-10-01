Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359694A7CAC
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859055; cv=none; b=a9RZo/nwWoc+IjkLYb89tthzPlqCWeuHC/omZrSiqvJ/QxAeRqbf7HejzrIenFhkUG8pBNi58C9Kyd1GKFueCJPUyM8QMDwQqq+uBbJ8UfuzKQzhBNjtmjl5RyXKQt597oCjhANknR4x0jpjN+6LW+l+EhiX520+5bWlqqyRnl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859055; c=relaxed/simple;
	bh=qsNumoTBSrwUbU7OFJ613pVZJ7eY+2K0f3zdIYvMA/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uq/kx/XQvb/ZvxdF9k+kOnENyP8leHlTZK9UOoxC1ubKP8HOk3QOSR1mZfzQQffQ8laDTcECsPl7eHokDxLRL281NKFGDYXP0CmHpujC+wOP7VTaQ+aiwKBIYNEBhw7UckubVn3ZR401KnQ8UX7jTQPB46iuinIO2tK+k5pEqzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUTKbEZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ttke/296; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUTKbEZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ttke/296"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xSbn1289152
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 12:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVRR6552Q7i6toyIteovKxKFPdp0Ro8m7DKjvVzJGL8=; b=JUTKbEZTXKMh5x3v
	VcOxq+OX0snveClbfS8PvAGvErOeT3BQHd5pgUONLYyycNhzpGxkuouNV9W6xzrq
	USF5+RCJwCcnv6BAgJQ4pJZtsIPR87M72cUQPvx3viLPnOTGlS40pZZNcl9IFa9F
	uaw5pjE5wHHx+7fP7Lyzv8Wup5qjbm1GsRj31a9vHj2IBEiXaoIsyeyGcAHai3ad
	0dEPM/hgMCwgDiSZkx3sY1WYDtMCFko9J5lMVzxl3AdKo2NwAhGqIF5lbsUvoCDv
	jNJ6yuYZL4za2zOmMozq5QCVq5c9C5658t2+JuOm0GqVN8ICH11KYdueKfHhndHH
	usIV/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjc0es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 12:50:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc19d8e59so3965685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790859052; x=1791463852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVRR6552Q7i6toyIteovKxKFPdp0Ro8m7DKjvVzJGL8=;
        b=Ttke/2963NoQMVMmxF+umV0oyGF7XgvktodBhviBNl2pO0UnufonHE8QWovuG9K3pI
         UQ9ThdSSw4zdXIPrYXBsFSupF0wjMWK1ohe0bV9P3R2qNA3erkq2UQXeBj6li076w9DP
         R7rLM0gICiS4Sa059UL8wR331f3cfU6ZflrdxhpLJVWVfDITIxzhAvydRRFa6FNsusVy
         8zB91ZCBq33EN8O+8GWM0H3CV4A0DWSLIpJEAFRuUTHHm3GE/8AjPP+o+MJM5UVgnwHO
         0ZFCdInd8+SH3muP2fylf/ceGY+5XIW3PBhIV9nHmCqXvargC0YwmMstrr3GyCRow5vP
         o+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859052; x=1791463852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVRR6552Q7i6toyIteovKxKFPdp0Ro8m7DKjvVzJGL8=;
        b=T8B/xscg+DaxtkiktZTk3DIFZzcj5pMWuFyu6A5OrW6PPPxsxVM9v+W3VnMZ0k+S4J
         Qjo6VkjEJ1EM/Vvyz1PibEul8Fyf2F40aZRChEyijFdlVTz1Fysw0ncccYrsZqvmlSjA
         ODefInSy7NaeRSp26elDb4B/IkHZ1N2rKyj2010WU6bdgyB5SjXaxsAKeQ3MJpNOWlki
         vuOdXabSasQcVBFj7b9hCk7RWoeEgmRASL+3yxfPzX8dSx4nHmyGAbhgZu1n9u8y/+RT
         ptKLWxwotgsWI0JXq/cIkYkXUMNlwnIs4C5EVammnSX4se8Xy6Gjg7c9okbelSbmBZRz
         JAWA==
X-Forwarded-Encrypted: i=1; AKwUvBx89Hi/fNOrxq2yRVHReoUo1jOelL6YnWjH0Q8Vo3R/ThYzB8DUgN7O4mqegfgw/W1rRbgThaS6HXJANxTB@vger.kernel.org
X-Gm-Message-State: AFuF++lZrLGS1lQ8FQ/gJl6hN/wCLiru22r1NVR/j1jdd8SttQy5IZBj
	GS4iWN0mf9+dTVyumC4w8blPWMmZJlNLRV7dRuAVTbz74wEqwxnEOWTtrSDzEmsHYMD+MHsoioq
	aLGVmxT/IqpQ5YjmFpRHXDPACyNBBahbWUtaQ/Ekdmo/zEd1if8x69esuDGbo5Fy+R/9Q
X-Gm-Gg: AYBFou1O4NRJ0FppqxjM3w3wGRY3aEl3nB/FA5H0JyWAJbF5Y15NePyomuwF5reQJQT
	L1hgXqwycjDWjf8kj8SCpQ5xdA9MLf3ECNGwrWUYau+S5NtZgIs8JA4FEIQFwRoeDGleC3UFUSu
	0oKW+o/vEElRL30i/L/8n+Gtw34lefXX7jBTVquN+yvAx6BLZ93EGbtCQyBuU5lTcwXmeCqMUhs
	muJBbAbK8qztNQVaa4ZXyknb8U0HZ6C832Zqfumk1zMCzpz6T1jGusvZEb6WAXeRIunV1kQDpjk
	ImbS8YtZAK4SLyX5SAhInNNFIAp0NCJyaygddJBpKMN8Pibs16EcxkXJfsUd4hDOnqIaFv0gUwY
	BXZzEWtHYksGuljLhQzef8Q==
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr826925285a.1.1790859052094;
        Thu, 01 Oct 2026 05:50:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr826917785a.1.1790859051341;
        Thu, 01 Oct 2026 05:50:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e333b8bb1sm139289066b.21.2026.10.01.05.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:50:50 -0700 (PDT)
Message-ID: <e3e8b0b5-3da8-47bc-80d6-c47edf153d32@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:50:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add git tree for the Qualcomm pin control
 entry
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, brgl@kernel.org
References: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe572d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kjj55Q4xDMlVXKy7ifgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Z575L8oaOCO3Gr41x9Z7iSlo6q3NfmaS
X-Proofpoint-ORIG-GUID: Z575L8oaOCO3Gr41x9Z7iSlo6q3NfmaS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MSBTYWx0ZWRfX1MHSQmpqfN0N
 D700D4SZrvUsoQts4mpVfXm7EDokeeYfEOal971IDUWjispyHIcuPkQZ7++Jw3q3IEhdUMer4Hl
 yXY4kx+7ddg+MbHaUcsnn823bfSLTeM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MSBTYWx0ZWRfX2PLiKaNrvKIU
 7HSxshYpW/0X6UBBijNadVSfZGIrhgC+IS0JTl+ECd9FF3d/fPh0Pf7zONBkL/1Y8TWI+Du7Bt7
 me0QKnPPT7oZtR7WpslE+0XWakc83rgDfGOV36NpMxr7JRAUeLKVYxBZdZ07NcqpOuRkrzzUR6V
 tZog2JKpT3OBlx0kGh3IP9VMKF+7xNJH5jy7u+IrlPB4Sj424q0/nlX9RdjylkwA90njDDOd5wi
 Ho9WQbKRba2cw6leDOSa8qyqVupb07Mm0yPqNMuwd3d/cJp25pIH3GOV/VJyEPbcPgbNlKN1ylb
 hXJUfNWWZ5oK84wD9+HIbK794RcPcjFXxqLax/2mJo8AClRwntm+0Zg0ElswMD6M/CVc2s1jruy
 UtTiYhVFpt1DppuxQ/odKvCZYaMBGBc+PSHFEJSuqoj5/jWKMjO91OYtZhCt5nwMco/ZMpCA/PA
 TcA6ztEZTO/+7GHU4Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010051

On 10/1/26 2:37 PM, Bartosz Golaszewski wrote:
> I stage Qualcomm pin control changes in my own tree before sending them
> upstream to Linus Walleij. Add a git URL to the MAINTAINERS entry.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
