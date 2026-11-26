Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714329;
	b=vU7jVFTNIHxN4It9/M8BD2uuPUbO6AVY4LK0uk/cKoObe8NiCrI9NWxzPVtLm5kmIzU/
	 MYTp6zJj3Y9cI9AswOgaNxUIOdovIu7cLHOc46M8Mc8CXwxRfHx1OrF2vbKzDO9IGGEHq
	 stcWvF/Hi8o1jkorvkdFosuDOWTLAKUlsB7CXv2gwfwtBsLZVRqKtLrC2QWEzHmXnHTYt
	 cYW+EoFU72X039m7sbKvICFVHkps7QZvV7ZNNgfBEmL+/L3aVAiQPBXDFRVmJtoKLZype
	 H1hDwPIujh2v6MUm4hUVPAW/j2Liv9RuSt/CZrW9ol3UsKXNMQlLYGYfdwbkfDKhlRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
	b=0aiCYWrmYRxlAI6o3PRuqVL9URLXeLiTay+RdOqbCzDcLYOD6ak4hFk73rR+lFka5h9L
	 of/8JQJzgIAKwEoaN1Fhfp8Z+St+5BrAXHcHS6z8k4s0dPRDuOhGJcxAWtx0IeK4HiglX
	 kS6k0eDQC3Au8+or03MU+U3gR3LwXB3ohaTESwQKt9h00v77VX3n37zBDjQno7AgL05pH
	 WUg8Yc6L06Mcu/ZC10mPa0OQfOpHRPOjAf6caLsf6NvE+V09yedb4VCyRRjAOY67sN0BY
	 WPab8QSLlNl9uCIURK5831jMmzTJJzqQV+5SWeAF28KpO2b9JX5ZqV2TWWir4v6RhPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHGHk5DX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nje3F+ca;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A888606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 17:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A888606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHGHk5DX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nje3F+ca
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu7fK3357246
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 17:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=; b=aHGHk5DXdGm+xSDp
	t9TtYweyTDwg7nx+aw8ZFt/A4TBw9qeDCgg+Rk1EhOv9JC7WmZcHw3uq7TzB8mJ1
	ySLjoKw0s8ibVxnjV0bumOY700ksROzumX2dHR3cpsSUiE4Ch8cdI6f7JoI235XT
	b+5UtH+1SX2LIgkSMAp0tSDr+R7ZoxwuqArXrfd5gse8yfQX7bSHGuTSPHQzzw+F
	yW+Klx6DzA/g8vB5ubtG4OAtK/1cL56WROPjCuRzMYk7eEnyViM4Pzp48ro7efxr
	E+T4MT7EK8lLFLnCKG8yp45V4/2ZLyXupCkWuRhPo62UdBiTwY/DU/h2elj6x2BP
	f5SPqA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfc067-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 17:32:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb91e288d7so5528628a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714327; x=1796319127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
        b=Nje3F+cacqnvCTzctixs8NCEWVijYbfMviH/izKO/RFLP/w6t0jppyy1IkPx5V+W2Q
         BGI8lI4L5Me/gxuewA2OxJI7Ey1w4OLOFlPqnagnPRjy2zXZa7Z+2omKkc+dGLO+HAiI
         GW1heMbKXC6X8lNSw92j05BAn9/yHuUEeFs+zwLujtuWCWleiiOkMHP0HicKSKWtB9lc
         8Rcd8foAhed1jYwThxYGRd3xRHsuHHmYZhq1a4WoroyPXWKbqE0YHQdjaLs+sciXz9qM
         EVCDReeT3EiuIMVUT0o4lxbjfvbEGETXt2q7x+Xf4Xbv/O//NeOxPPpvYdzy90Nt2Usj
         dk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714327; x=1796319127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
        b=rRuiyGYpPkUQIh3pkr8dsWouEKHm5fuNkSnfRhv6cacV2MhjbsovQyKUC4+N5QYvgw
         3D1tB4sVJ6qGvor6Uk2/TbAoi84sjDFJEaziTPIUCKQJ1vuA7jJN8DNNw6+tUfj0jfdO
         0CVgormUtdZGY97zga+5IJaxjC8lifn2CGDo/p3Xg7IZn4T7qkvVRKBCQoOLGdL8kQp9
         M/HSo1bxONDYrTMIzau3BPPNdLJNK7FT/cdRiVLilrnzYDUF9+8VQIKXsokZCvd4AL/Q
         i0xe3pCf9qQ774tx24615xn/Mz3yH3sY9Uppcujn9Flvi3TGnsv4R8dZDjQCqlBifw07
         Es0Q==
X-Forwarded-Encrypted: i=1; AL+hErFOC5fPJT79j/CZASvHyHhQzm7UAjNRcxTaTQbY4DnhalfnqeklkLsO+q+4d0VgBNKYZK7qzqGnCqG3nBEY@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q/D04aqo1EkTnAIZd8gvKd7rpHapzxoko9m4ztz9nxmUG87wP
	AWdaGqJhda2tlwYfGasPPk49ukiqODym9DeqgeMcwGiJdoa1hD8L9b2t++ec/YT7CrDs1ib5s2J
	j/v2aHWMxzb8ySXzdJCms6dlQThOSelk4GbcPv22n087BmuwBqXdVgA9r/BZ/ncqJxfHs
X-Gm-Gg: AZFdTZcURS/+5l7VTMDrMH21creNzH0kEJLQ05guW0M+DrS/HOQXqTJSVU9WeDaTiOI
	CeIwct8PXnT1kLKltgGiG37eM6DEHKgr6MQAt/s84h7D2VpjduCfCMgs1hn0QDd57HDZEDuEbIF
	Tx07S8UQIGQE9G7sRI2QX5T5NT09pJLNvZ8ULP+EhtOuBA+moHHCECQRk2El0ywenbS+yINwbFG
	KrxBYChFWs9h30XA6VgfRmFlNWIUJeOrz1S2Hwd14nZaxSf6a8gVhL0SVeJQ/WUlXlKdXF0Luqa
	Xu1A5hypHk0t5gchPTcLX+TOHpVqu2oIs83gUtECfnwiyBDeuXWefx1iC7pKDA4MYiyc/ZoZ1eH
	kIMjQVDEHT/A4UWQqYGtMqByYXTx+fvFdklBXcA4xhiZRXt2TUopRmtX7wXkJ8fyEli/CZSQdS6
	w2JPrWD2hNEPeURZRs3o8m7a4iVKIQCCvRhBfZ2zVE
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr24967830637.48.1795714326859;
        Thu, 26 Nov 2026 09:32:06 -0800 (PST)
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr24967805637.48.1795714326388;
        Thu, 26 Nov 2026 09:32:06 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm7776293b3a.25.2026.11.26.09.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:32:05 -0800 (PST)
Message-ID: <3c1b3957-3ce6-4109-8465-246d87e408f9@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:01:59 +0530
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
Subject: Re: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HCDV1cL6sjvAy_VO4JGQ5k9uzttfSscw
X-Proofpoint-GUID: HCDV1cL6sjvAy_VO4JGQ5k9uzttfSscw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfXx30VkYA1/7J0
 2h9fxnOeeTurB8M6mxBjWhzM8QaKUDDr6tLGIms6arp8UxpXb/pJbnHsuZMECSmdw040mGwUKwk
 8jZS19rXFiG61KUzIMlw1yChQZ00e5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX8jGkpvbKadRg
 6E1qKjzuFL2xKvIMb/Egk0OqZnhnIsF9Y0AEoKPaMGnX6F9HVaRL9t6k2zRwlkEGCvux5O2gvHt
 CeXgHIwTcqHf4OTwLIloNZJzxlam9NW6I1YeJXzR10ZmnVNan2peW4tZHF0FfUyynF26oJRztG4
 /yg0TwLa2+9Uxy+ZsoRw29iberZGmPfMUWvUcu9hAtXjGqokZm0c7ZBMPiSCKvClp/spLXJFV2k
 sxp0Ir+3nBvxXAu5iYzvgAgzXVkxHjxWY9yaZkuUzXzJzbjzeOwhQl59FP5mSIQKZCeGLtXIWOU
 d3IzM4IWnql+XVZ0sC3VF6J6w2QjQEbwCs8TufLpDMiCtvGjSjYT8Qhz2hE0NXv+CgtpPX8sr8p
 fdWS2JrAH33FV31OpFmipZnyvlyArcYM/AeuJbI4XJk8bKINKGfoYDb9KS8KBgqvIVeUBkU08E6
 +MkoTnmlxZ7v2VU/uTQ==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b086d17 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zjTcfuHnCzxvNZJ2CccA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> clocks. If clk_bulk_prepare_enable() fails, it returns with them
> disabled. The next suspend returns early on is_suspended without
> re-enabling them, and the next resume disables them again, so every
> failed resume leaves the disable depth one level deeper and host-mode
> wakeup is lost for good.
> 
> Re-enabling them on the error path is not safe either: the
> level-triggered ss_phy interrupt can stay asserted, and the handler
> can't make progress while the controller is not resumed, so it would
> fire continuously.
> 
> Track whether the wakeup interrupts are armed and make enabling and
> disabling them idempotent. A failed resume now leaves them disarmed and
> balanced, and the next suspend arms them again.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 18db19cf2065..e7fadad9a4e1 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>   	enum usb_dr_mode	mode;
>   	bool			is_suspended;
>   	bool			pm_suspended;
> +	bool			wakeup_irqs_armed;
>   	struct icc_path		*icc_path_ddr;
>   	struct icc_path		*icc_path_apps;
>   
> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>   {
>   	int i;
>   
> +	if (!qcom->wakeup_irqs_armed)
> +		return;
> +
>   	for (i = 0; i < qcom->num_ports; i++)
>   		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = false;
>   }
>   
>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>   {
>   	int i;
>   
> +	if (qcom->wakeup_irqs_armed)
> +		return;
> +
>   	for (i = 0; i < qcom->num_ports; i++)
>   		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = true;
>   }
>   
>   /*
> @@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>   	if (!qcom->is_suspended)
>   		return 0;
>   
> +	/*
> +	 * If a later step fails, the wakeup interrupts stay disarmed, as a
> +	 * level-triggered wakeup line could otherwise keep firing while the
> +	 * controller can't be resumed.
> +	 */
>   	if (dwc3_qcom_is_host(qcom) && wakeup)
>   		dwc3_qcom_disable_interrupts(qcom);
>   

