Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760037;
	b=wUpKAOXHoUOFzyJhzRSiFOadDMq0vmkMvU96LYU5/GfcKT3ZbtXXGuX0CZA3eA/QFfI/
	 sUlUqqzTG+Tjc1kzKvxZ6sBEpKAqbP9RGJEwfx//M0IHhGblMgObgFEZHwjKEnjtZJpcP
	 EbV4fcjABj6eO1q/NYUOKvxbMakC3wUOjEtDlBwBE4ogKgzSLWaSk0NBHD9FDhCvN1/X9
	 wmGIKPdYCmTaVNyjCYWosjHie3BPR1Ju3yzRJA09nRZCnJjYw2frk9z/6ehOfrQaJTNYn
	 e6ER7ZGYSUWAzXzKio6Uu62yptgrY7jEDOfEK5HJLTxHXXVmhQ+Lt3iDOC26M3S4I9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E9CC07hQOVJkkqtZtDLnCAicLRf+9VZKlInJHU1RiKk=;
	b=b0p2AF1ln5/SQpgz98IXx4iXqQZsfXxbG7hD40mqnZnC+XYAJ5Y7dnFHAtxJK3uEwIT+
	 Sq8PgTtY2mlEsrX4vuUTTWv+r57LlPl9uSLwqwbSh/vOxq/7TIbMo37yf105wOFE495g9
	 b5002peTktdkhhrvQ2CLNo0Oqi875b+B9REzkBlbq49iUKLT94JM1vXyQFQND69r7NwQA
	 SQzlUmTt+Jbr1WS3Zj6ymzFm5DYmXVXTCFUcgr4MV5krayKZ79veQrmfoEz5I5yZgTSnM
	 +H1NgMUT7sYRYis2Js3u1RVlaR9XNAmcInL+ZOZ5Y5exXAMIQtWJD/f/JLlRgC4jaDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVtAmk4L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LtHdleO8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71C5606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 02:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A71C5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVtAmk4L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LtHdleO8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RPJd230660
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 02:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9CC07hQOVJkkqtZtDLnCAicLRf+9VZKlInJHU1RiKk=; b=LVtAmk4LEotoftOH
	VWPItEGZExdAIDnzvwuT7TO9cwr4gnN+qdWnjaj2oPiWFDKktawe7q4KQslIxWl+
	JK+0AfdffHIzHsIuZZilFGAWSxJCK0JQTgujranuscBLSLzDoTeUa65IASyDSdSk
	htGxNag842FuENnybhAr0y7wNGHZRm+p47yRAEwwEaGIqaEI2X+ZgJmJ3dgPFGkn
	eddBizVEP7aqGjjxr9wmxDx/xYrOUQu8ujxAECt9qdbrWYdVZi9owVHYwdxyAe+m
	OUkPsLaksPfkM1+c+rFxPVdQrlH7hFmmvcA34VY+Y8QS9aMYo/lO7Vm7GRti1nw4
	VPZPNQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypjr8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 02:40:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so767975eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 18:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793760035; x=1794364835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9CC07hQOVJkkqtZtDLnCAicLRf+9VZKlInJHU1RiKk=;
        b=LtHdleO8JtP/AKvu4Btmbqjwp8jqlopeJsmMvt7IlW1z9pOWCLX4L5P+t1Cc05+c9M
         b789mTx1bBjiWrboX2mROr8FR18Du1tNEqJGqyH2sjYF9W7xxbjGBZ9AYAFw7tRf8ALd
         5QNa4MZUgNgZ/B0Wb01SF/gTZP5CzDbfuBT0MbNUgC97uY0btOwoINjQRMRvBqwqBOB8
         PcWeutwMVM26il8g0rug95QsXf+t6wfmbrK7vyxoE3hJvRo6+DZ+C0Kfw/Pkuyhb7ip/
         yJ484NzKY17TPW384xDE28jzNdNSi69pAs6foy6qx3JegsmMsBYmUiFAlbclzFcZEg9B
         WLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793760035; x=1794364835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9CC07hQOVJkkqtZtDLnCAicLRf+9VZKlInJHU1RiKk=;
        b=oAAHaprYpiF4LFU+Z1+/YOvr6UOV/TkYkTym0T5Jyc6pvXTxrKWwEIQMX02boOCMFE
         a/VoCzSK20v3UtUa+B34a/HX1su4ebVajzrFtxAntc7U6ysCBcpqC4I/AAbHEjfWj+ji
         eGBW5bSzNvPbE8is0UHKD9j5uSrkgomq67LQ3i+uHcdTTOy2QHcJTJdAP2AcVvtEv66B
         vnX+ZjnyRgstc1q/0WYGWgqE6JdExIgpTdstIBorXyCF6fN1mOuRs2ueoilWxssjbHM3
         xP8c7fIVnTMSsnUZn06NVA+fFrA9Ha5AjAMKzcIGZ2+bminUl+l/y6eftHSo0So87eCb
         /4ow==
X-Forwarded-Encrypted: i=1; AKwUvBxakG71Vr4JWaZivP7Y2e9+ZQV5esHGxjCU938IbiBkavmMs1wzNny1wc2jC9IRQnzqo6sXbx3ETpubtjin@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rjf908/ujPFVUPwNiM36DWHdx5Xok47Flp8/o9T2dapLNb6oF
	6+kR2+5ewuuPBSNVWxpaLi/1MBngVZypWTUEmCiL22MeurBJrJemYZy2R+ixvcwOVA6sB16FgTg
	thnh5+TrHv7h4Pox007cjRObD/C/u+b/U5q4tunupoQOwp2DrYt1fAAU1YfOEc1VuEjis
X-Gm-Gg: AYBFou3LBzK9ndAQchvVliNO5pfszx051cyvE/v7e6rA29iFp8a8lPyLewFJ3OBRx82
	jmn1jXEi1fNK66fvRIgB4x4GLSHMy2eV73gtMER2t9EMixTYliJl7fGkt4PE2lYYbsGNHBDvwhb
	7yNwZx93okRjF0/K+2TTfUBi4Gcis6tsZysggrKje4soER6W4C10PKn0YjLOaLuV9vbeN+ZfDRc
	ArHUQPjrPKtKIw3Bw6iixWZ5aerpeY/IpeWlusdlCJu6EGf/bEarX3PCSaxW8MsvO2tqRQHld99
	47FzElMPaP8htf9HeGnjPzOqyoLGqTVtEc6pLWxAkx1rgf3JPJk1ZN9OD/cgdRP9/ZKAHzBdeaQ
	r5KLk1kHqb0zfXS+3WCdAuKUegU1vZqrh95MqePzEEmJ3Z0pPCY9ZiNInFsJ/ZH2NyXx3UnXOhM
	Jx
X-Received: by 2002:a05:7022:b059:20b0:145:4ef:e8de with SMTP id a92af1059eb24-1ac55f2d1c2mr23887761c88.6.1793760034285;
        Tue, 03 Nov 2026 18:40:34 -0800 (PST)
X-Received: by 2002:a05:7022:b059:20b0:145:4ef:e8de with SMTP id a92af1059eb24-1ac55f2d1c2mr23887714c88.6.1793760033417;
        Tue, 03 Nov 2026 18:40:33 -0800 (PST)
Received: from [192.168.1.4] ([122.177.245.68])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm3571048c88.22.2026.11.03.18.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:40:32 -0800 (PST)
Message-ID: <bf1c44de-f180-4c8c-90a9-6a97603bc03a@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 08:10:10 +0530
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
Subject: Re: [PATCH v2] media: iris: Retain firmware confirmed video_format
 across GOP restarts
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxMCBTYWx0ZWRfX14W9IDcO273p
 bs0KpzTW6ZeB1BJ4d7NXbHKvZvYm3d3hYgafCsfH3Xvm7KSpZPSwPzVXP03zsbkAW6mnMpzDSc7
 maiL9RgCNN1zh4ldO2iOA2lOHaTx12M=
X-Proofpoint-ORIG-GUID: yMjbus0lSW01Febd3XrUbDD4FvqVhQ7f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxMCBTYWx0ZWRfXwp/rlTiOvzDr
 aYVgNIyzIxF8nBSRjRYpRqd1o1yZFPbNbXAkfhoVqIG4EzvGnid55v6EJCPqcHXQyGwZx7VvtDo
 htcm9NOx3+hzJqFQHanApt8jwt/9/4Uu94oHaWChObN5BfX69TzlbJQQVZSq0/E/xt2j70ZTqjm
 pTjNW1Nxw+byHuEj7CIdAzcMUBaxPGV46TsoyCbtrW2r2iObLVcLAghm2w4u7oGxdCRkptAIKJY
 xkJfqqsVvKSSxn69kmCJ+qJqpjSXlBdak7vNa9sR14Jj1nBdr3MLt6Hyw38ruq8GIv+P1cOkFKd
 mS9kGxLVuUoJZxjAQFHSLmwSSFwE5Tl6UK0aQVDxrMWhJnjuVhAPckDJeYEBT1cxMwmmBHWdnIN
 cPh1gCfs5/qQW3+48ngGDS2Mrff961vvkTuQihd/R6JSJut7HZI0vULaMASA/BrPCzB2JLXLKoM
 MUu4N6M90ve5WZD4eBQ==
X-Proofpoint-GUID: yMjbus0lSW01Febd3XrUbDD4FvqVhQ7f
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea9b23 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=EtrGahee6tu1RMNbwH63qg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=r1EkoBCNwLdSQPggacgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040010



On 9/5/2026 7:27 PM, Vishnu Reddy wrote:
> During speed-based rewind, the client restarts the decoder queues once per
> group of pictures (GOP). This is because playing a GOP-based stream in
> reverse requires decoding each group forward first and then showing its
> frames in reverse order. Each restart makes the driver resend the colour
> info property on the bitstream port, which firmware always treats as a
> sign that the stream's properties may have changed. The driver never
> stored the video_format value that firmware had last confirmed, so it
> resent colour info with a fixed unspecified value instead of the real one,
> and the value firmware received kept differing from what it already had.
> 
> On every restart during rewind, this looked to firmware like a real change
> on the bitstream port, so firmware sent a settings-change notification,
> and the driver treated it as a dynamic resolution change and paused the
> port. The client then removed its buffers and built new ones for a
> resolution that had not actually changed, stalling playback once per GOP.
> 
> Store and send back the same video_format value firmware already confirmed
> so both sides stay in agreement across every restart, avoiding the false
> settings-change notification.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated the commit description (Konrad)
> - Link to v1: https://patch.msgid.link/20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_common.h        | 1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  | 3 ++-
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 2 ++
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index a27447eb2519..439197e9e199 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -141,6 +141,7 @@ struct hfi_subscription_params {
>  	u32	fw_min_count;
>  	u32	pic_order_cnt;
>  	u32	color_info;
> +	u32	video_format;
>  	u32	profile;
>  	u32	level;
>  	u32	tier;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 388a36ff2b07..a43a9d7687ad 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -358,7 +358,7 @@ static int iris_hfi_gen2_set_colorspace(struct iris_inst *inst, u32 plane)
>  	struct v4l2_pix_format_mplane *pixmp = &inst->fmt_src->fmt.pix_mp;
>  	u32 video_signal_type_present_flag = 0, color_info;
>  	u32 matrix_coeff = HFI_MATRIX_COEFF_RESERVED;
> -	u32 video_format = UNSPECIFIED_COLOR_FORMAT;
> +	u32 video_format = inst_hfi_gen2->src_subcr_params.video_format;
>  	u32 full_range = V4L2_QUANTIZATION_DEFAULT;
>  	u32 transfer_char = HFI_TRANSFER_RESERVED;
>  	u32 port = iris_hfi_gen2_get_port(inst, plane);
> @@ -806,6 +806,7 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
>  
>  	inst_hfi_gen2->ipsc_properties_set = false;
>  	inst_hfi_gen2->opsc_properties_set = false;
> +	inst_hfi_gen2->src_subcr_params.video_format = UNSPECIFIED_COLOR_FORMAT;
>  
>  	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
>  	if (!inst_hfi_gen2->packet)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 8c2644c7f6e8..8b1ff253a560 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -581,6 +581,8 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>  	full_range = (subsc_params.color_info & 0x2000000) >> 25;
>  	video_signal_type_present_flag =
>  		(subsc_params.color_info & 0x20000000) >> 29;
> +	inst_hfi_gen2->src_subcr_params.video_format =
> +		(subsc_params.color_info & 0x1C000000) >> 26;
>  
>  	pixmp_op->colorspace = V4L2_COLORSPACE_DEFAULT;
>  	pixmp_op->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> 
> ---
> base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
> change-id: 20260905-read_video_format_from_firmware-ecbb322a6fd4
> 
> Best regards,
> --  
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Tested-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
