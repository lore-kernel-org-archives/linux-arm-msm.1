Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A1454936D
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954299; cv=none; b=vD1QbEdQIMuk9SOuazv4Uz8wivAKnfCh3LcqSr8GXaqeoD+Wjqsh+/+vifeqUGPElaSI41h9ZBAMavR8lvadQ+yGRczYDu9hLejlwM2FbwIn/wPpxAqvQkrYGwXowotqejwi/kfznkz2v/R/3ZpfEp80snxTtvTGlDJfOWYIF8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954299; c=relaxed/simple;
	bh=fjyTOfB64lQGaBKja0eGbqH0Am4ca6YXe+AJ+f3iVuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USwL7s8iFEMMhIXgpZmavnCAFJ9HQD0QlD8itkWhAbD86Q8IMyVREbFj9EOD28j0frAiqij53K3syqD8eOejUase1wOQ1/WvoVZIpFOly3e9SkZ+M9Ni/hlgZJ5RubKqMUGoXTFoVn7mBsWqL4/HqsAq53ajlwSrBuGCDZVzcTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSMhLKQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lvp/16jb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSMhLKQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lvp/16jb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU5cA2653433
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h26Vcuumsflho0hjqNnrhPlw320bUX1zGixu1CPR/fg=; b=GSMhLKQ2z+TgfBPM
	BV1SYwW/baUNi9LrgfIRcXm9xCdYWBmUGz324rl28gj/TvxhA430Qwjf/eGRdbfS
	Mmjv6d8jBDIgwDE5CrVfgmDKv08uN+aubu9X6d0GZLu8hs4XXtMepI874SnC2EAV
	ejN47m9y3RQaFKUhkn/onY1Ey13A37Wcy+Gz1QogPpInFC0sA5kSS+TO3/7uQkYi
	076TcC3rvZ/In13Y81monBKDQQIPvO8D6y/zxqSoEAEpos/oniHqXGPLtF5N6sHy
	GrfjV5CpJ3nHLG0jwEyDsrlmw7R4vpilJAjIOVIultNhkLsVYLWegejlpUBF6GIz
	vMw7CA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3u68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:44:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93495488976so72605085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954296; x=1789559096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h26Vcuumsflho0hjqNnrhPlw320bUX1zGixu1CPR/fg=;
        b=Lvp/16jb5tAw7TdLAnGJC34SUlZC2srXuwYR1nsmPDyLBmx8bXXsnec9dEtwSYfpL1
         J0vLYCGQ0CN62fHlVEAcsolB2zRFTmj+qJ/YiUJSk0LUS5Nm+Y1Cq3WqwTz7RQTVVRtf
         FJqRsjM7D+evFSGQYWvzFcC3ba6CS88IWY0ZBJfnScatFtntj/DBauF4lQrR0r34/Ukr
         BrwaxvrJzzEYw5URqCWvfDfxsOKoPIv0xo2GTItXtTiMtMqsVcykcsfMbPS/aldRp+TA
         aXweF/tOaScShMISp3RMt12lfXMWZC5SwyOEnB284VZR0KUrmxZ7/NdfUrWrYIVtpX+7
         nDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954296; x=1789559096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h26Vcuumsflho0hjqNnrhPlw320bUX1zGixu1CPR/fg=;
        b=kHRMSUFd5hWk8UBA9jP51vP409LJJu3DqCJ7LxWMbRFiRzwuqqGMSDD89zXeVcKUz8
         1NxoclaEp549U2zFSvmuf9DJvc85tDiVmcjJgReArmbldgCkWGGJJvXTWMhCeqOl+3rk
         T6rj0fIuJ8EnYq0dleshgk/jFb5BIqayruXErXAyHrm5Duhsr6/8vC788f0jk46Lqrew
         liontc/amLCmwO+TLzNI9fyGzkENLYgeWkYwcmaQZJYrd3mAGCWdc9BFD1+rDERKiPoC
         SjoGGLTR83OJgg4PH54u37ZQgsOGO6oMQWWiJmRoJTH+vImPNED/0MI5od48VzYwMmAB
         mheQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM66EHvB1X93CZajs/hDQq5pDbEB06G83qVjCGZAznsi+orxEH4++rMzdeld22ITFJa+xTsgRKB+mGaxfN@vger.kernel.org
X-Gm-Message-State: AFuF++kq9Q0pvJmYXeNjkY2hrV7Q4vdMHCHq1luAPrWu62j54UHPdDSU
	eHAx7ftn8FBA97qC+wUc6cuGMpKWFaym8iiwSSepXO2ePhSFSVpuGYhqH0Kqli197i5aM6zuE26
	Xx0jQnDFdddW50bgNTI6vw/XRtlYzw+4xcsbuTrtQL1tAU9BlgEM8/5HKrJ43FGUlQs+x
X-Gm-Gg: AYBFou0RN//htiI9sEfY/AAgVTwWD1v+tgzfpjdH8LwQKWZZhrxGzfouxAPPpj6v5j/
	VQ9Zhnrhslyduy5Pbqr7DylEnVyaeyPWvxtpbjoUDvm47TDCF/4ySTgVCTsjuRg5ljfincLJWxB
	5G23/pcsPn/xJJ137yEb7yroUejiEHD+pQ5ZYVjT5BCf1pumiAxJmbRnCZcTvm+yCGEgtru72lx
	wIZC6CIyDcjWlHwePmH8zPA0E+toiP20NkTzkbYGLzWPtLCAhwXwJP0G/fhQUqijzgYd0DidbOa
	QAnVl2wD+Z2T3P+9Xvo8fxpgAxyPWda66ESOCPCxWjwFW7wYfYa2fBnI3XHzTm/yicqYtOWJA53
	NBzCQ8//PlcaI3XaSeVL4zg==
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr2556537185a.1.1788954296215;
        Wed, 09 Sep 2026 04:44:56 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr2556534085a.1.1788954295769;
        Wed, 09 Sep 2026 04:44:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a839344fe8sm2101393a12.5.2026.09.09.04.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:44:54 -0700 (PDT)
Message-ID: <80467f6f-7a0b-4ff9-998c-192c297c4b4e@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:44:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tty: serial: qcom_geni_serial: Keep console RX
 functional after deep idle
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke
 <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20260909-correct-icc-bandwidth-vote-constants-v1-0-fbebf6b3c341@oss.qualcomm.com>
 <20260909-correct-icc-bandwidth-vote-constants-v1-2-fbebf6b3c341@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909-correct-icc-bandwidth-vote-constants-v1-2-fbebf6b3c341@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX7LsVfALivpWL
 V1AH2q3l392SuuTsczUt7mccIaoVPtXMS4XCLHEuyq/lBSvbcKtPhP4iFP1Ip71FzFas3aDvH+t
 m8GmcHY1EpBQi/hhyOrxh8yih0hviBCm25FyAim1w5dO+ACyUUWe+LAuH2av95Z4/QOojPi81oh
 Mec+58BxN54rP1o84ufTFVVVzIyPnbY7FaCpjMBidVx2s0R3mmpAMP5plBM2DZftqXoQcrbcGTT
 xXklv/5c0hYh+rK9rTAvMxqF+uhXaaWtrgeII4JkCNFNKB3Vcsl17t9GA01ftdpGvOUkRAvQ8F2
 RwjpwW9X+VmKG2KJfTaSMTtFL03Ljg6L9cP1ApGkjxO+rVMseR4UuInLOlYmbvsj3AXGHR0cWjs
 oqjmL3SsUBPlBbzTKkbdwTiAgvHNpgieo4ff78bKyAIX5pG4Gx2nuvxaac25nZ+gbKUhLiIkVaV
 pSG7LkoYv5cAkupYW8w==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa146b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xozMsgXYk9iqUyCLfgEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: O59Sk38jC1MAyjrfnfK6kzK3q1Od3ngv
X-Proofpoint-ORIG-GUID: O59Sk38jC1MAyjrfnfK6kzK3q1Od3ngv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXw8JpZr6QrP3h
 1NEuOPbCET5libJQyWD1t/0jQNkwPTVy5UFx1OhS1QeMxvJRa7twMTonuvGTaZHdNHxq9faEBAs
 hvySAwuMGnX+IMsiCmqPJmx5pz426MM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 9/8/26 9:05 PM, Viken Dadhaniya wrote:
> At baud rates up to 115200, the serial console uses only a 1 kBps keepalive
> vote for the GENI_TO_CORE ("qup-core") ICC path. This vote keeps the path
> active but does not request a QUP Core 2X clock rate.
> 
> When the CPU enters a deeper idle state, the missing Core clock vote can
> leave the console RX path unresponsive.
> 
> Use the 19.2 MHz Core 2X vote at low baud rates, while retaining the 50 MHz
> vote at higher baud rates, so that console RX remains functional after deep
> idle transitions.
> 
> Fixes: 7cf563b2c846 ("tty: serial: qcom_geni_serial: Add interconnect support")
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 3633723acef8..b4b4724f1c5b 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1482,9 +1482,8 @@ static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
>  	 * Bump up BW vote on CPU and CORE path as driver supports FIFO mode
>  	 * only.
>  	 */
> -	avg_bw_core = (baud > 115200) ? Bps_to_icc(CORE_2X_50_MHZ)
> -						: GENI_DEFAULT_BW;
> -	port->se.icc_paths[GENI_TO_CORE].avg_bw = avg_bw_core;
> +	avg_bw_core = (baud > 115200) ? CORE_2X_50_MHZ : CORE_2X_19_2_MHZ;

Downstream selects this based on whether the UART is a console, but
I believe baud rate is much more likely to be a good discriminant
here

FWIW you can remove the parentheses

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
