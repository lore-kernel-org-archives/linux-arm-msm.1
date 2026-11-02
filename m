Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639358;
	b=EsMO4IPv7r/uub0q35MN7ZaIil9NO7sJECjR2N557gMdDLImbRFcCb6kYx2b0YAg5+Jj
	 7bQt7ZouwdhG9TSXZKjICZaG8AIfdiZnvLv2NN2ds7aLbPHkSwd3dIXQD6fnq25QpWx5m
	 Zb1ZGCxIu/dAwR6fDx3grUULPww01t9fm0gBKHOgOOg8NEI/qAwMdtapT/AGW1GMo/eQj
	 UeEc41yBAda5d0SPPcNSKVskMRZETsf52Fmupw/qyQGsvOW3OXLBVIyAMxJ421+6rG2ka
	 KviWhabv/cYHVCbO1ixIVdPVyxDHyRiBvyHY4ZsY/2xEPYdQiLEku9OxcdgvZJIH1tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639358;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=;
	b=G/Ju143T7rLQtIxSuYTF10JiQLHSrmPGPZY7tUFzO2hPHHAmCZ3WqWxTC9vxgd+88kp6
	 zbr6h0CJTzHm8n+nL9nBz1MIREUFZvUBFxBcl32WlZbPI8N8ybGPhZgO6kjAyf6QOLA1z
	 LstQVRDk6g4I3JXZZre8D0AfB/NmtF+XwcyxLhujOBwlfSHEQiKRgQShX/kkTAx6Nkyzl
	 uPjUSnNb/lRr3pbojVVhPSnxXBeqqrSKMOLtRumIfXaFu8/y7knLPPXbD3gvKxGsUI4EN
	 t15EU2K4ouV5eJfbeXhCCkWqNUyalUKpq7RIRDfrFs2sZH8KoZBzhj4b++5PqTUZr/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ClalfCpV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkeyjU8z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2199606A908
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 17:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2199606A908
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ClalfCpV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkeyjU8z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZ9VH215020
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 17:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=; b=ClalfCpVKYgZwLpG
	o4M35d5UPvOB5NX3PCW+UtWCe/zCbiDgH2TXEs454m/ZgbYkfA2wN5QKBrMmwhwp
	mW+8EFAvJ1QYqYQPZux5vIuc721PJFh5wWqUOAGFhiqI/T8N4LFG3MKtT7LFjFCd
	3EDEi0Hn8mVC9sZ+OnlZj4GD/eJGFenVIGeomtnUNt8G/dKREKU3nEVoAcS1NUS3
	U8PMouMLQlhGA9FU8XdmrIju7alWNd1a7Y/ZQcVXQd11BTcuff0EN8SgCDh55Rbu
	8z4Rkjyx7U7UMEpUYKcwf2UDODeyyzSpiZNxEhXj4yFunj29HlC5NDz2SxcLrNMk
	jrlTVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfeaaty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 17:09:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so3185667a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793639356; x=1794244156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=;
        b=XkeyjU8zw5vb3LRIH5CoQoTEUZwAtCQE23Ian2FZjZf3jIIZF6TkUg5bG3NZ4OOVYX
         U5UbmuzwBz+jYj9NKGt0WN+uCgjsYLl6X6vbpfNi5b0oNR54ziPnegaNGTmbPX76sOAh
         Ook5snab4oqXo2nuwayn/ht4HAbJ7+GaCWAVCBYEkn2gL60msMd5ld4ePGLq0fQwR9AZ
         o1DcF2mDc6zQs+tSzfl3m5Iph8MTxHfEOCjv88nJXzxkEjKciD8/m96/O9z8mVItC/xI
         Z5mSs6ctD7HinJ6iVSWXmHfGba+tHb6TVmGuS/KpIPAg1NgdQ8vGbGwUUcWKjGzAqg0d
         MOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639356; x=1794244156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=;
        b=US1wqCiwZ2RajgEXX56c+Gd+L0632PX3KKsBuozGNiR1jJd6s6mS1AMbFO01/apIlU
         M6ojr6YJJTZi0SgBwwgh6PG+jOaJCUEdmjWVA6Pn1EwY6+IS9gGuqu6rbuiUnJJlE5ij
         oplWD+oaiVuir0TxiZFeUHhPf6OcTYgTeRw1Oz3sYr+jOIJ9wVjnB8LYcweJqxKwDoDk
         r+z4Bvnj/kZboW7dI7DyNc153f19KXn49j0RrwQ8tsE/vqWP4U534LsHQc89QXoBbHnv
         y1SHq74MCK6HIeBZsxTAhOZPAY3rVnpWOzCYmZKcDvaTi8yDGHiG2XAQsA6VPHIIzoWJ
         XKWg==
X-Forwarded-Encrypted: i=1; AKwUvBzy1QtpQRhmbB44A64Gnr0QQ5EPfuUUILdTBCSq/bCAIqXVxkbO3GIUY0AYZTZO6xFqi22XdTWa5p+hFgCt@vger.kernel.org
X-Gm-Message-State: APuU4Z/91Wl7XHWBWyPWhbRpHxyS36vyrs6LgOKyN9HxZ13iBZF7qU9e
	GsqLOK8Kik2KPzde78N0ZtEl41aINgNUMns1+jH09PgE2S2/tWVw2Fg4AqDQC5+JWaO5/wjPhw1
	XfvpQLhogLlmWUlVxlz0/cU+tMZuf7QVN45k/d7J/kECTpqGFBJQGRZtvHfSZoeEHvdK5
X-Gm-Gg: AYBFou0u5Za1mp9m8IH07gVJOUY6OEnasMh4XmbYEGuZIOxpBsikSFq+nHcI/AvZg4G
	K6WKPFTTv37OmDav+Fb1yOq86Tsd/GU5zdob1TQGW9wMG0Nu3JypPzZ1z0gsKYsAusmsQjzP0TT
	+pl4iErY5WLesCvtsLJELfIZVO9D/jYjmgoN9u0DpK3OXmEUHdh4A12tVEncoHVkQsVwcoiLi/9
	m9hzFe6dxZ0Wh16qy9wNUSwPlhQp2FIgIWciA/hepzCV3KWv3M5lwQLcikKQ1XwUU8ueitCLFnY
	dB9O6dno2rSQeuIpk+2S7mh3eE54COv6lLp1TTVMlNDGxrUVCxMGbHiO9Xv8lcHRTE1w/EkMCLC
	fsaHdvazSGZkdiPLIywUrowaH/Z917R27ewfJTMHRbmTOqYXJZUeum7+1u2otY9Av7p3fziRH6e
	HZza2z321yNuav9hiUMkONKI+poQEqKS+F3r79ql0=
X-Received: by 2002:a17:90a:ea0c:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3ae89834f45mr4756783a91.9.1793639356389;
        Mon, 02 Nov 2026 09:09:16 -0800 (PST)
X-Received: by 2002:a17:90a:ea0c:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3ae89834f45mr4756766a91.9.1793639355846;
        Mon, 02 Nov 2026 09:09:15 -0800 (PST)
Received: from [192.168.1.6] ([122.177.242.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6c4259sm35635a91.14.2026.11.02.09.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:09:15 -0800 (PST)
Message-ID: <3da347c7-6c7d-477b-afe6-9dbb37208438@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 22:39:07 +0530
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
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8c3bd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=4cW2FY/XLap1olThQF9nEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ptdc_f1R2aCmbPsLd1wA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OCBTYWx0ZWRfX4Y3ZdSPrbD+j
 olpei3mDOkX0VclVcjLVQAbUiGd+rC4ijJ0wGDNNZyJYqwBg78v3cvWLtRrYPBeOo5BX7PT0Tse
 N2i7Ef53WSXSij8xSUdZ58mVXqIAJTBLhh5IuWj2uFRyZZ6qCvEelyzzyukJlLoZzzOTUdyKn7V
 /TLvzGnFFvsmTwRZpksAtRVGMlW7QdWGfoljJRI/bpky9OnsMIlUH+SCpqIuJ0hVQEt0ehqheEK
 64ZbTEHGTHoqbXC37gHKJhtC1oMZSDkc8/CLcwo3qyVTY2MbJaayNyRiB/8RnhfkIPvE/t+isFW
 5T95fbdKXyMeY02pPYlWYywEPAjCo1y07uxO8w+P489q1qFWF8hM41xwDIirAmbCjiiYdp9jQFo
 M3ZBHXLYHlZqkO707XPntthmjyCFcIBoVMJRLD8j5DsrvZfCh9VNyqPe6VyifaXnLMQ42lFkgkV
 aiXXjrOhwFbmbxRjMTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OCBTYWx0ZWRfX8B2kaezXWbbY
 K92kdMPNapYlKMVA/nQt6eO3EFI79KKOBBTjH0/hoDEkk39po/LugH/tAGiul2I9qqapvk7o9cs
 Q891islhqdLl+BgEgCmImKmgRq3I/PM=
X-Proofpoint-ORIG-GUID: mG2kIB5WcGAfh_5oV6Jh-9VfgNaezzeY
X-Proofpoint-GUID: mG2kIB5WcGAfh_5oV6Jh-9VfgNaezzeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020068



On 10/19/2026 7:45 AM, Peter Chen wrote:
> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Without this bit setting, USB2 HS device cannot be reset after it is
> runtime resumed. For example, after:
> 
>    echo on > /sys/bus/usb/devices/1-1/power/control
> 
> PORTSC.PR never clears (PORTSC = 0xe11) and the hub driver fails with
> "port_wait_reset: err = -16".
> 
> Set snps,resume-hs-terminations on all Glymur USB controllers. This
> makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

This also fixes one more issue in Glymur wherein the HS Pendrive 
disconnects after exiting pm suspend.

Tested-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e269ae6e10ea..023a8448449c 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -5544,6 +5544,7 @@ usb_0: usb@a600000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			usb-role-switch;
>   			wakeup-source;
> @@ -5620,6 +5621,7 @@ usb_1: usb@a800000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			usb-role-switch;
>   			wakeup-source;
> @@ -5696,6 +5698,7 @@ usb_2: usb@a000000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			usb-role-switch;
>   			wakeup-source;
> @@ -5783,6 +5786,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			maximum-speed = "high-speed";
>   
> @@ -5858,6 +5862,7 @@ usb_mp: usb@a400000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			dr_mode = "host";
>   			wakeup-source;

