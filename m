Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308DC53ED02
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986720; cv=none; b=WbDhMxD54vspBfhfylzG9W3mB+5gqXYEaorAzwDTqSHH9AOSTa+I37nOL7/DurU2KT3sqGEwIxW5xke3ejbptVN77wFq+nyjokFuG3OiIVK0rJhyhgpwCZmu1sW5aSkcXibxN9NGEt+UEt02gu/tcJgGicNme4wb7gBB2wpkCOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986720; c=relaxed/simple;
	bh=on2PEhB3zQq1g4jTu3KddnrV7cQSAaGoMUS/teguhck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FMCIWpIIbWq0PzacTxD6L4pQySPPOOL05QUpvRr3OnU/2Ty6H16qzdcf1/8x7eP44vIjcxztGuuhgh37bZxt7INTTqsPyb7ZlEtU6AYQIN5gqKvg/TmLbxqDa6Wc1rzpkGMmKqEO850MoXQ4C30u4f8AdT/mSLZL34xDs0IEtVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4YyJgJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gqm+93QL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4YyJgJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gqm+93QL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBXDWI2685285
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=; b=H4YyJgJCbnABl9nz
	FmZ7sqPp+0OU5N0uI4WwVsQ6BxuZtcWiYZwgKoCwW9E/5flb+LG/sKBPnUMaNxGb
	7MiUv6vxm7rrJbssZja31V8RfPFlrQZnt4pmlMul6VixjbYUpA0WzmfXSmxssXsH
	GexKlSPHb4hhG/zIxIejefUy3VlURerLDXzfPEfZFE6w+E8ycwFaDDvZSLAq7tVz
	Ph5zbELPlNS8yM7v3qB2/zxDXe08DKhDLq2hCDYVlbcyt4Cx01KAMKto9sft7DEG
	ZNjw1b90zrQdHjUPewyxunuqZJHwgsqSU4Q9iiHBK/BDfDVeL7xKFNUXBM0H/+jz
	QAPAzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1wr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:05:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so53098685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791986709; x=1792591509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=;
        b=Gqm+93QLsvhXkJGzpMiguhMUoOOWRp47JkJb/vPHAmMuqVmorC5sjrbFdCBfaRWp3i
         5yh6XyFHB01QIV/05mexdANyKCBPLA3hyh7kF2udnQP9kH7v94z6GEamTe+RuzwNrY59
         e7MRyGo9tjbVFHTp+LloYaLEvQAFqFbN8wvMbgUxV5I+gj8KoqFhNOZOpcS7pGKl351A
         MfroU84up89C1p8xQ13PbqfD6m5h1mSgva89+GPg+CicaxXavVZJoxQEAaR87Mq1V7B3
         QXmo6aACGyekZVhW/EBQ+2QCp/ur3XzpfVn37YrnMedZRgj6DlKE2I6m9Fa6GewkYw1Q
         5I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986709; x=1792591509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=;
        b=P7sv60JauaJQquJfc15g0MmG7ZwUy9j6QDLUzeuo0Q/hFcUHNA6deEzHDXnYDDPd/P
         DVyoAkXQng4GWGwppp/qWpy/mgbxkPyuwHbQ2wqdyB6wiBKviE3nIEXE4HEowztQpIt/
         JW6z0WEEWgFeiEICW1GaqqEeWofh+yBgjJE+Mn1gvgo7aK05KC9nzIlWefMcFurce2GT
         beEXdXOtpqO43iwM6KrsnBEwh/c5w6sYUfDePUC0K90nmuYTVE+9pmh26IZVRgp37mTe
         qenk2aaUCp+D6F2ysas9vnuB8vrfweVLGsVPQGfk7kAol7LqsIk1jaEZ2OhuEGVYQvvt
         yphQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4w61exhgxmkiLaRpiZ/iV4PMpSUQtpH2JK0z3vtPbLgSdDDKEkEHmFopF0NkJA94h4Buomwf+HC+NBrab@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9qi1/wkAX+LIwD5z3rFh1GmjYYkbGappe8/lnjDDl4UWFyGRg
	1TwlOgVREm4B52KfHfh7wmH1O5URfbg6SB9EMv3ofCxASvnwGASdbn9VRSUDMylhDGthGRpZPIM
	bXFPdCUoyVuok1XsdAXTa5MkFuLqrReQLiIXfhXBREmZRTd9vlFovfYOi5owOHKgTMTVm
X-Gm-Gg: AYBFou0br0fXGRBq+qdA4iMmioEa6mAdY+l5jQmDU3L1TN6QLEjsQenwrayPCro3l39
	I4S8n7GEker2KYclrfMFWevfAeCspuym36nB4b7g5uAii4LV5gAu/kM+ssQyExq7eRQQwiYK6ya
	W3T5yZzDd1apqBUwYKyWdxbJDtqUTZbDmkFhwk35LSKn/cu92LQvxPWZDDbhLAkOu4VXfd6ddPV
	4PtkSxHv7tBHQtfr+KSwwYFRmwzP6WbNKRrhJCnIiv87symI3d0EwCfldnc4xbxnjgMDYf60yA+
	ocXFwQpzpO7BoNyr822y57vbbLsJkGdkoiOuh+9TF1HqaOYcOkW+kO5WSRVv38VyUkh/bL6FArG
	ne3auyN3Vmbvx+EPqihqQhA==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1775883285a.2.1791986708843;
        Wed, 14 Oct 2026 07:05:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1775875785a.2.1791986708169;
        Wed, 14 Oct 2026 07:05:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c6805985sm38426281fa.2.2026.10.14.07.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:05:07 -0700 (PDT)
Message-ID: <11f513bf-fdc1-419d-8eb6-5cabb6220fbb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:05:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/5] arm64: dts: qcom: glymur-crd: Source MAC
 addresses from a UEFI variable
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXyfK0r2UG0Xeg
 qrEBrHaGg8xLeRYVnzTZlJgh4oOlzz9ZZz9EEV8z5Pd5s7COODDZx/Qv2jw4KzH9MDF5A6nkR77
 OdBlH6Pj40kWvs1+j9oEuvQ0vH48ekk=
X-Proofpoint-GUID: CCfLBUs1D8BpvXsrs7voqwfCpOijGAsL
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf8c16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jRqq2JA-ig1rCJpZVWcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX3WaagU7teET5
 aTkK/UBPBkH/M7rv4iD9erLVc8J0q+gYl7XEmSm7fxRxXTpf8OXvIy25wbHCCF45Z7f/P8q72Rd
 6H5OIrQN3bn1hdpu3ScY5RI+KCXK/qKtmS4zK8XpaLctacTPyT/Uhtd6hGJLsQQsO7MQCIxrui+
 p1gMZSlxAWQyb4G+7I89uLSIW+w/6xinBnlae3so0XZeHYiL7/td//qpQh5B2MhXhJqp58Fm7Y3
 +SefBkYs62owmz04GrWNvN+8XwGhyG7f5/ku6hu4rgYJgM34jZ8NyFw68ZNG10JUP8YkI+vIzTn
 dNSFabpHjPDGdl9N1/7VRr6tIxtEGSzMTIUWXVT9P7CLNaZToD7eWbkgLlPr/1rJ8vsy3SoVe8h
 Y6XKNLFoz2jr+yb8DQMv6AP6jkTNVCyjDZqgkQyp8cxGg0AuVKIpEgEHYXHYYLxbWx2ok1Xu8jm
 hUY//g37vMWOaEKQVSg==
X-Proofpoint-ORIG-GUID: CCfLBUs1D8BpvXsrs7voqwfCpOijGAsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056

On 10/14/26 3:02 PM, Abel Vesa wrote:
> Add an nvmem-efivar provider exposing the "MacAddresses" UEFI variable,
> carrying the Bluetooth BD_ADDR (bytes 0-5) and the WLAN MAC address
> (bytes 6-11), both MSB first. The variable is looked up by name, so no
> vendor GUID needs to be hardcoded.
> 
> Wire the bd-address cell to the Bluetooth controller and the mac-address
> cell to the WLAN endpoint (pci17cb,1107) via the standard nvmem-cells
> binding. Until the variable is provisioned the cells read as zeroes and
> the controllers keep using their default addresses.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 58158b51fe29..2dd09ab1d550 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -31,6 +31,22 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	/* BD_ADDR and WLAN MAC from the "MacAddresses" UEFI variable. */

Let's drop this comment and sort the node

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
