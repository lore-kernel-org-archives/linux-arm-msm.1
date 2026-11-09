Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233806;
	b=xJYhfyUKVQbRfUP6ISTeSlTj/JEfo17RYo1UaYO61gB6fPUQu8FYtmJf70Q4yWog8FWA
	 ZcySlbE2iKk8ogJ11JXsSkW/e2g9UgaHj4zTgF2g8Frf3g432LtVrKa35ZOq/xjfeBdP0
	 XpZ2FWWd17NcoC95sGYpy1mUkL84XOtbvIEtm/ZctEHco+m4VpJ5aIrn1G973tCNwxqY7
	 ejeeGr0XRTmZNMoxS1Las5QAo7ixAJEKaZ4gwtz7d3d1Rv+X89r/fLkR/rqcIMLENNBuz
	 YQK+OCg4KrId8741W2jj2ljd4O7ufumCdYQhJkpeSZ/BYipPFHP9sUFEQ6AjSACf/2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=;
	b=cUEAycc/87SNxpXMbU9OTJIyfBY8ZEhC8zy7r3e/BlWMrwg+T1is8xk437Uqi1A522Ml
	 hhjaNhAQzznxcLwlQpaIOD5QLcc1THTsT1XrjkEA0bWacZ5ae07AnZdyg/oRV9MEkLEtk
	 qk7vVK1sr6ZthqVJjPfjK0nFOcV4N4cwk4/VYiKQbAMT2oPanKTQ5jTJRPSQpnYP2KiC1
	 WSDHTD0pUlTfHHPiQRKVjeMpNqYKvVbFQ3aLW4baw5DvlN5eKXWXFa5D8ZlVnKaWt8eH1
	 Ej2SVkPEQdgTHQyImwbyCbhkIcnNyj4lxJ57hvfFWYbBoD8dJA4D06mJSrTaNBXHqlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGurauri;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=es6JitvB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8C7606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A8C7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGurauri;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=es6JitvB
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFD6Y4025852
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=; b=YGurauriakt763yf
	MADv55l0Mn+7QLIicKiJcxF0lBKecrR9uUxQ+fi0zGuR8lc/szkS+P7JvDYOpJw9
	ARXsfPfFx0Tn4QtkzVcNkyyhY6cCDP+er0J46exeuQFi5MPbt5RyLTfIZBItcUNx
	vuFgYYJ3IL9EYn7pzadZzTIowrWzzzrNZIMMZdJD7MBngTK/3GvCThDLjnYForcL
	lJKBrv6WIMP1+WiO9BGOwnAN3G+lxh64Gl8NJjn3NfySJujCrr7TZJGYe6SYyGyL
	ICI0MRgbxJmKVonVgxLZF6cocaJ3ieiX8bBt3VLl2PFRMD4R/zVaihXL3rk3ZYjc
	v8zzPQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua589afg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:16:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecf0967947so24240e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233804; x=1794838604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=;
        b=es6JitvBg9YNIEWA+jobw+XiI/sRJOzf8QtHhiRxuKvIqBj8hm/ir/hkr1W1LcGLPe
         cobvZ+OChwcBd32BJdRt3x2NqKjh/RftAGEM8fIqPZnYpLpxMs6p3Ta6aeFPh9kl6j3e
         fnU5EKn9NlTacw7KHZD0DjR2Ixykl+haLGyGXUKj6TxSrcaRaH0IN5Tb7j7CPWvMbIwv
         SMmuJT3/Dnn3vGmGdfHUWyx/ATm1mkYh68Z7/kGSmwESvAv97C4OhoceL9yaVgHr3rZs
         lhr56mv/u2NOhgp0NEPVEKfwI88WrKmfKe6p/FHLWNwrvQN7ttNe6djnnd74LCkePRFW
         kRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233804; x=1794838604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=;
        b=ZzEIx0w0dDqtK1mYVFktC9T1F7WCj9xSBNBgGFaVAyWsf8eOv/jLx42bbFy/xvCVfU
         58QJs0AEzc45Z3LHUE3VnygplJKAGc9aRYRFvf+KSpxdcBT5IC2AhIDmcMbLCO/31P5q
         awKNHhB5LXTtyEaextRLHQGJvqNdMOX8j1niYxWablB8Xt/hFVEw4pP4Ph0KMQN6Mhf0
         i7In1F0rAFCmQj5GN6I0/Fb0J7fdOeIjpD2wz+qRxafHURbKY9Pgd3UR47V8s6Lx4xPn
         WP7C9nVd6Nyrs2405k8sf6/4Bps022jeZ1FGmU5XDRKUQCxVdXP/bxRHsmTJopccNgwQ
         BNLg==
X-Forwarded-Encrypted: i=1; AL+hErH8aj+4JfwHJLD9PJA27SN4YFtiRvEkJa3J4CQ4CMO9K3u62YdlJoZQnitoL1rGfHj404snUr/YBj1n9rLK@vger.kernel.org
X-Gm-Message-State: APuU4Z86bYc7TDNqk/2GFB5bKRMLdXuQHRjIOSQ5MN1kQlpnFW9NCgZr
	0X/ZFbQ8p/avtuqzaI60/h9RiOdHZM3/s3J7VqHbkJCEgtHQlrMd7tXvwXrWfLxjAGe85Fbd4RY
	1um5tvK8ysBIsZxs7x3baIXNpfPDdC9JztgFJV4dko6f6bgqXKolxEptryZrQFy6D/94X
X-Gm-Gg: AYBFou2Nyn6t9pzFWjfFnGi7efTC8IhEXe1Zu4psLezYKEzlObZQxElpa6odo30XWtI
	JypfRUtIPoq5/woQvF8fFX+5ALpLoPikoHordHBvoZ03D8DGFOSKzH+L8DaerGL1k5n4DYavoYn
	992RbDRDlWdPSqkqwaawDJS/DknkIDJEVjdhXVkc6aS7fD4THh8FTbiOkep78Y+O4S5Q02lMLL0
	Q6lDRLQP3On09x8oncnTo3hakd7g0mFJ6UPCX6LRb+9Wmj+c94aptw6CV3P8BW7HR7Ha6ROxrou
	qHq/05WZ39bsuQraMUwgiuLxUMTEqS+VaXkoDLIYU6cyGF2O0uBuh+/eBk9WLG61r5aphJuL4p5
	b3/Vi/hD7cR74jIFYtjViQITGCSpyTXopqpqFJmNZR7mnstDi3ed54C5ReNZZQ4t6jv3RMg==
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr956866e0c.1.1794233804209;
        Mon, 09 Nov 2026 06:16:44 -0800 (PST)
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr956838e0c.1.1794233803786;
        Mon, 09 Nov 2026 06:16:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9d6867sm171976966b.84.2026.11.09.06.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:16:42 -0800 (PST)
Message-ID: <a32b69d2-80e2-49c5-bb44-d7e808253ca5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:16:40 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: mark the ADSP fastrpc node as
 non-secure domain
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, andersson@kernel.org,
        konradybcio@kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfXwALiDVJF3ly2
 KcI0AeqAuQwBbCr5g8fPUJhzwpXmgZ5pjyr0BcS+pEcq2pBmLaIM3sppwdkZsjP+m9LfNVMDO3O
 C0kpIIMquv2nDFNUMYT90a6T8uE/n4Sqtnd0g6Z6wJBr8/8jdFN6b8cWttOL+w0Rp1YXSg8alXQ
 Qc8oDA31tkFUDjUqYTlx2pj3TVN7+zpVAMqHQ/UssWNgl8vRwzqvNrAtdJiO/rHMyQ7ozVCaZqh
 EYJv6Pv1Wa3nckjA3bx13R29bO1jO2KBzt9LJaCoAJrmIILPm8b7M116Yu6ddCg23c6J+WwoqLR
 GMdlu60XzpCAKtWxS2v9hQE8FcyFolM8EROQZcnQU9Kwegh1zAa8fIlv75JjqgfB33sB0tBQxzK
 g6ge4/1hQR6sxqtP67JWMeoVbLDbCeIsKfqsBUJ0R6Vb4OFytWG6uK/q7S5HwdQJymWERhMPwk/
 8zRP7gxdnjhr2vaewkA==
X-Proofpoint-ORIG-GUID: j8OwZo26ckYHBMqzrZVSpUlqgg2yLiEX
X-Proofpoint-GUID: j8OwZo26ckYHBMqzrZVSpUlqgg2yLiEX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfXxrVkmL5iPFAH
 hAPRHIBCaWewEfyKoN7lSFQMjb9jlHH1nEEiDgl+IMzs+YpC6i8ha36h8VE32K1JJkfw/A2GxP8
 bFG3ttnUTpnpsiK56jCU9CeTVXY36M4=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1d5cd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=RWRYIkh9dnzXWyXN4okA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090056

On 11/7/26 4:26 AM, Qianhui Xu wrote:
> On SM8750 the ADSP fastrpc instance used by the sensor core (and by the
> other non-secure ADSP users) is the one the firmware exposes as
> non-secure; the CDSP fastrpc node already carries
> "qcom,non-secure-domain", the ADSP one does not.  With the fastrpc driver
> keying the secure/non-secure split off that property, the ADSP only
> instantiates /dev/fastrpc-adsp-secure and userspace never gets
> /dev/fastrpc-adsp, so libssc/hexagonrpcd cannot attach to the sensor PD
> (qrtr service 400) and iio-sensor-proxy reports no sensors at all.

Hm, this is a nuanced case - adding +Ekansh, +Dmitry and +Srini

> Observed on the Lenovo Legion Tab Y700 Gen4 (TB322FC), which is SM8750
> based: without this property /dev/fastrpc-adsp never appears and
> iio-sensor-proxy exposes neither accelerometer, ambient light nor
> proximity; with it, qrtr shows the "Snapdragon Sensor Core service"
> (id 400) and all three sensor types report as available.  The change is
> one property on one node, matching what the CDSP node already does.
> 
> Tested with `make CHECK_DTBS=y qcom/sm8750-mtp.dtb` (no new warnings; the
> single avoid_unnecessary_addr_size warning on dsi@ae96000 is present
> before and after).
> 
> *** AI-assistance disclosure ***
> This patch and its commit message were prepared with the help of an LLM
> coding assistant.  The author reviewed the change line by line, ran the
> checks quoted above on his own hardware and takes full responsibility
> for the content.

Please keep that under the --- line so it doesn't end up in the commit
log.

Konrad

> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index cf947acc57..9302481b11 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2571,6 +2571,7 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					qcom,non-secure-domain;
>  					memory-region = <&adsp_rpc_remote_heap_mem>;
>  					qcom,vmids = <QCOM_SCM_VMID_LPASS
>  						      QCOM_SCM_VMID_ADSP_HEAP>;
