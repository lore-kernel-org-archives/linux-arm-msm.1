Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163583;
	b=4fOz+L593IfOvokaTnvIC0dRTYWhSsEw4gP7Ag1H6JGn8rqBqRQinAEGtBx/T3J4dB6G
	 pIx/6wWb6N4si8cQXpYUZ4JUgsi3p95i+HyAPIjtUw/E+A4951HmqxPN8kuwL4E/O1dle
	 yTP6toTFVzGPU6tb0IroZ5IeOVRAA2o7PMREI2KEeV3ALSXTDnP2QLP6492fc6DDKXieL
	 oK/mOV5+gk/SJdc6sHxLy49jd7wAMnCWEbtLDZ+s2HlEEalVksATX+XlFZ0PPkgwQwoJN
	 4MnSOBRKIzWzxrj7SWHQdcY9W5e5h0FJQ6zQUTiK5G1H2gcK5thqdDfIGVDLynP46mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
	b=35XM1i1hpkP97YUk8llJMzcbS7v6XIrLrYYwBnoqK48ckErTyQPjRDGV93rvptPady1e
	 qrYhhKbOde03zs8v50/FHR4ati+pCtRm3LGpYq1fcv2OKGpD4r8XHQgrh8thCDgvryUlN
	 ty0gKjVR0z8FUP2cKY0T/QYjj12noAO5PCktdTv8xL61gFf/r3cElutBacZ/tD9Fj2rxb
	 fUShL+9OyNzdmRP1rBsTHjx4TdnRZn0DLb01gONRgAU/I/DN46/DpwM/hxwQ5KWutWML0
	 pTdU1AqU4FizC42fVd/fQeS1EF7YJXxVCjO0NiRLp7y6lebElbUQC28G+o/zLA/H3Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AkMpuipO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bY/H1PAg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8DC606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8DC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AkMpuipO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bY/H1PAg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f1HG1112277
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=; b=AkMpuipOaXUQtf44
	LKnET7leBzKWmLPkW706dCVmxRawALoP2UOII7YjXnYENh/C/2muz/3xSK7iiubO
	yja2NECnxTbE7LHzKVAWycd4APujSgH6EX+/5oUuHEzX3AKrM7Vl+T/1tE83qdKp
	su9E68arYKGVXgclpypqQAfb814KfdaIEGXdCGVV6m2BltnYz8jUNc17U2twrmjX
	PZUmDnRTbZTnM6EZetbXqpGTcTZkbhy2gIyiUUtJ434I1xpsYXH92uIlFRA2oWe4
	DCRtQZmjYg0ebi/RL0pimpkMXyYhDXUGxvLt/XYbmMfL793SYtq8ny0p6oKGBQQW
	exHIMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtrua2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:33:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131befso117539085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163582; cv=none;
        d=google.com; s=arc-20260327;
        b=ViJnwK2/MF/geaNQYhi9SPFmCKSdNj3hCAChl6XBMTACWZ3pqXHOyh4Ve+LhhyNmwu
         AmPURw/FSsqVhsn73lIVWw2Yxuc+MW0/Jxl9I7k8DZ0mjvZaVpnadsmJRUjjCdyaMVA8
         d3OleKQnTdNFmwbws4U5yw5XEX5KXD1LoXC5Lid9+KBcQRkwPj1pvA8eXGPjYZ13oO71
         Ryvwcg8T33sbrTls1TP/PbzFJAksT8wUZZXY3vVVp9SiExIT3Bdgt9MJog3dcePyjvpH
         +UNqwzuYCxALcJTCRKA3dNwOTRLravsRpNybbdN5mwZK4I2l4bR5DBbfjb5Kgmdx4sg0
         buxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        fh=N/htMJmfONAMqgJhJgK0bIYQxGy4AqEBaYtReFedJgg=;
        b=RVLwABCY/RX3AhtADyEKE3dli+JkA8jM60ZZIzLsug8hwLrcmjh8ZGaJdIA3tDP1D3
         4cZBPZ4Xuzq9PL7291RqZGvb2Aq+kJzORfCti8eNnZ6ufChnr6Upa+yYVBDDCZ5elXth
         vEmHpZmPapbtWjEL87Yb0cMFbP0r5VqQPt8eBU2IY0BjoD2p94wAyjy1a1KfsyB4NNnk
         PaNvQQgacDuQ7LtD4Gzma0332fVPyuNWSaRPImHMf3jQIMHO6Yl1TpXXG9is8/SBJVSQ
         Z11jafN8FXCEGa7538oXqblZfM3CNooz+HBAlCgLy1MeXaxkDqSPfAZSfmgxHikcDV9X
         4C7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163582; x=1795768382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        b=bY/H1PAgTU6t7pOPxCBNbQC9ZYUKPl6AY+CCqVcyeNY7uWBFqCUHpyJpJcqPZL807y
         jVBmPEPfzxix/UMYqfzkiY6TrKKVrkhN8VCZ7XQYOfcWzQ3fcSJI5ZsCC2jVctzhpZgT
         +rQveC/jnyIHVZn7Nth12x2NA1ofo69otODYg9D0kpMLzxCamgdsE532898/MOVYFpJC
         wnIdYlmRwyrMsEt/5Gx3YwJ9BMxcKXT/jFhzF6k/EGHKjGyu4NpAp9De/1n7f0G0F0wX
         w3Reub736UBoHvOuu1CbGgCo29ZDj9BVSCnGOmN1Ovr7wN30jNtdYS9NY3WOgwFjjuyu
         Vlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163582; x=1795768382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        b=NXN37U75sQBhVebG7hZmI4+rzEE812INr1hJzQZcfdH9j+SXS96S5mZrRDBrhr9hDt
         afn2jVNJlKCLPmZcMAI/8V8gTsNADfeJ3FYTZ3mWt72/9Jo5RPxtvGXF/k3jR4CA+iwp
         8HD9zly94253mdmRuvDBFilFmuwq3IN/IyKymPS5NYBRK22bH4Wfz/0TTEQkJlDONN0F
         hDgDTJBvpmM3guKKjJtYTQrRLOlu9LiQIjJxc8L1qn55cU8RHqNG4RwdnjzY5puRVjkE
         jPkuQDlNuCexrnU2US7Fcp0yYNSxwZxRaIE/+SH5nXzoFOGoC52K8oEADMMUR7vBvGQd
         5UaA==
X-Forwarded-Encrypted: i=1; AL+hErH6RyX1us6TsAGkSSihefzdM7bgteQCEh/LbWXg1Q/JEI+8PJf1DxamATmGPUu0mOtHXuokB3VzfcQcVj5k@vger.kernel.org
X-Gm-Message-State: APuU4Z8xuMAQXhI9/BsjpJhhDU/OtjpfEKKmHIfCsJ3SCIyuHYQp0r6j
	FCxj8kyi/mNTSM+OHay5B1rU5y8JCY3sGhfivM+zByjCYjTNBfftbVc9oUlHpMF3zfLYg8PKxyr
	DTEDEZtg2doVeT9zfZk73+6bgN7gArnO10cq1s4f8hbYN6j/vTFubS92wg4hebYR/8Kwe8PRzX6
	FX0VNUsQd8DhbW6jokUiQv1on1Dwb2ESMuqKvv65ugd08=
X-Gm-Gg: AYBFou14qc+kmwlNYPSm2GYjHYTxrZwvt288sCgimuqrFuOQnmIbp/QmbmjDNeoUEaL
	DGOFrbEi+TwaWu0Y0JxINu1/Kqy2vfFzFYIAu7IkTubYUFJyP30gn2CUrLdoh1NcxTB0qO968QC
	5BBujMUK+2Ztxz0ARIu6QJH0ujOp80c1SvegA5IYWQMqgOU5DJBLPO7Gvp0LB2dF6Le210scX0U
	NXnznA117oMEGN4Bv8fjtmrUDgwsH+pvFx48+UD84kNcEMKWrpKgMZQKA1TLxFnF2nHR4q3UAtj
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr163125185a.83.1795163581605;
        Fri, 20 Nov 2026 00:33:01 -0800 (PST)
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id
 af79cd13be357-949bda21c95mr163123085a.83.1795163581044; Fri, 20 Nov 2026
 00:33:01 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com> <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:32:44 +0100
X-Gm-Features: AclHuK9d362EMFPFXhM64AVRYKskGoTlaSxy6WxsQcqESpcHzMJ2h3YDR0lL_Mc
Message-ID: <CAFEp6-3TfPV0iy3O=HKZXPhpDpRLffL0RZZt8n9aVBk-v_HQ8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        stable@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: K2GP0C6ZiCQvql3n5-Ltja28WT9Vt4sy
X-Proofpoint-GUID: K2GP0C6ZiCQvql3n5-Ltja28WT9Vt4sy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXx5JWMAEWdDFX
 XJt4Wd7Zv7KkpXad/zAVuuAyjtOtU+/LUKneKAwGpjJRFPMmq9ZTqCQxWFG9HTXY0aU9oh8C9JJ
 +bVuTcR2EREmdUYrB/UvdOVqBMe8UtX+My6LfRxEcvWbzxXpU7vyrUprPVq78/gONm3E957OPjO
 ya6hAO5IExvOPAK0M4xiDB04pM87kCTpZxaf7eJqWk0VljCp3uePIdoU6sjzC/enOnNfJjcwRU4
 U4ZpFblQLorvs4qli3SG4hJM6UYjsz60QasbnQmdMPHfT8NAn8bpBUMzprRqIl1qxYvHzlhVHcT
 273WToQqmnSap/rQ9haM1J68I2c0XgKn5EtlKhJfrsQqGU3z2nsHKDZX2hkLj+FGbhiYAYtL1R/
 KOlUo5eTZ4Yc7Bv/3EtM8K5UQT+vK3RDkw7DhTJfnIXJTT31bTcazowyALe+GU/fd5gLp9JaVEd
 cp98vaQ86aZNhcMdaQQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b0005be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=idF7ahqy7yQlu2L1qvIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=L2g3GqtBoyQv0ocsUjqh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX00W/THBPYj4g
 Cqs4T9YcVnTGVjiEGQNakzsWw2jA2+UBi3WRyMIjozTuwVOo5FxZ4ragKKVL36GGrUjY6fPPJG8
 4XUbYuuzgYUWj1XxIuA5/VCxZ0FF7n0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200033

On Fri, Nov 20, 2026 at 9:05=E2=80=AFAM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, s=
o
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs=
.
>
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc n=
ode")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index f300de74c4..b9666feb8b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -814,8 +814,8 @@ bluetooth {
>                                         wifi {
>                                                 compatible =3D "qcom,wcns=
s-wlan";
>
> -                                               interrupts =3D <GIC_SPI 1=
45 IRQ_TYPE_EDGE_RISING>,
> -                                                            <GIC_SPI 146=
 IRQ_TYPE_EDGE_RISING>;
> +                                               interrupts =3D <GIC_SPI 1=
45 IRQ_TYPE_LEVEL_HIGH>,
> +                                                            <GIC_SPI 146=
 IRQ_TYPE_LEVEL_HIGH>;
>                                                 interrupt-names =3D "tx",=
 "rx";
>
>                                                 qcom,smem-states =3D <&ap=
ps_smsm 10>, <&apps_smsm 9>;
>
> --
> 2.43.0
>
>
