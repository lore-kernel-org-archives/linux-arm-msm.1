Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8293E3BADA9
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384097; cv=none; b=kcEBy/AksrX29hRGewJpsqQCx8I0/zfx0HvSYYtJPZEqsdAyecR6oNoKV4VaenCIvm6BcmkQpgzS7fkvbKlygZi3b3ky8FCqKeykZLY+3ezm7s6M9K7gwZNEDbE18apecfRlw6r2CdWUGD//orieCHJ5OwqZiBfGXLtaadSjzNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384097; c=relaxed/simple;
	bh=H1sQheQGIQzZaf8BGHarv7QlsNW/7jI8aRrywt54u+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSeTbe/dXV96sL/rSlB1li2SD8P88TN83F24n10m5zrRrkrX0bkwUyQMetNfngZMyA42zVtFFV6BQOyD/74gEU6TI7w4hm3+VzJn5VyIQhhbZcJAzr1vVgheK/RB80olj/NWepgMglJx9pscDluak9ALGnnx+4wJzxs3tFmOgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcfdWNwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7V1Ys8e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcfdWNwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7V1Ys8e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmbxZ314086
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GhdbIsYe4869hHdUsFlQG2aFmP9Noc9xne7Hz/Z5Kk0=; b=NcfdWNwA4xEUbFKO
	l0kyYjS19vTngKlA01bJHZwAelQFAinQFV7lzN4ca3xap6D36ZulxBcoIgAUXlLq
	ax42hev1I37yqJYfMPfCVFZQjmmE7QLhekFqPZuw3zJ5/6H+FOj3pl/1NpQ41FWM
	GJXO/EZjPZZu7uCQKQOb1s+7O/rwH3T4SvafYdngkryzUZmrMeqQXlHDWeB+YzOX
	C/hxAY3ziCcxneyUCMGkmiiFVPiw8XUoIw8m6qBuq157hTZ+Dw4vb9XTwDroNzOP
	eihMqLnluSrcli8xnI9eFovIHEe/HWzCbo3AIdQ75UPme2GSbMbiCKiWslxCPRSi
	fa9LbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c6b0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:08:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso39631485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384094; x=1789988894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhdbIsYe4869hHdUsFlQG2aFmP9Noc9xne7Hz/Z5Kk0=;
        b=V7V1Ys8erBu0XnAkRDFKu8xlAU6reQMuVDwi93agEuGPZUtcyFFcHfmlqwykLgJM8e
         XFyuf6Xdz+Ho4xylWmi2e9DAWvCRB9BuVL3BZ6AEudJRrdnBaNpvrEBnYu1cKKJnhPeK
         tIDj5j9VMQsZ/C9AAYX+vdegaSfnAA5MuMC8iErjt6eXtCoBWyF4eOZLGObYdY29WWzg
         QAl160jUmGxfxZnUxPXEZgQjBgN2gkQSNNa7Eh0DEnGF3ce/h95LMP785JACrF1/xgLO
         GgSslGyaDngrTnN07EoODZEcyoPmTrr90EadWawJmekfJvLA5WQro7zoXhkIYlZ+BFC2
         bvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384094; x=1789988894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GhdbIsYe4869hHdUsFlQG2aFmP9Noc9xne7Hz/Z5Kk0=;
        b=irCDKb6pykqxmdYMF6OmPY7c8hq3feT+IpTgkKP1otA4uUw3+Z4cghfwVUdwRDKvtr
         HioxTjZYIpYgwv0rkllaHgnoUOgfYK9ziwq4VDXRyhouzgs3qYcHeiKIBbjSONda/631
         CeYVzrTCHcsFWcqEZBI7z+r2fDS0bX36BO0p08xsa3naY5pPueRUi+0grF9PN7G6Ek02
         9Co7aFXUzHsuJYSqjW7ZHLPQ811LKcrK0S2tZazKUyOnpAi4RUjb/3oGEhbx3n6eUz8K
         msvb8NFF14wbPEqtrRIOQcc6yCqAV+ZnTXQXTa9Czxr1tYx4HX78bPJN9El/wi7P9/nt
         dR0A==
X-Forwarded-Encrypted: i=1; AKwUvBzqz5E0JrkUpnsJZV6ONx/PPy18HA1knZBIXXdyiX9kDQWHg8JDVl0KI67vKgQMdFcLWBY0CZmqljkmdevJ@vger.kernel.org
X-Gm-Message-State: AFuF++l8S7Yjy2aBatQ9vB9Fx9WXwQ3TLZfBR4m39DdS7sbxpWmtGjfe
	24KMTvQHeXIpVoKAqgoiCW0ZOQo3HVdiBwcoDzoo8xttE1tOhjamBZ+c+qlBh0sZaRtea64AyeB
	D/f/rj6lIwhL/0K10wL9JmR362kz5oWPhj+4feuAVPDB++PxhkGUH7TKnlKX7x/F+yHMZ
X-Gm-Gg: AYBFou0aV9q9ou9sYGX/RmRsMeD8JUZIpsQdi/aR8I2Q9SVLSxbtVcGLzcjQ7H2X05m
	4wzw0GU/e73m7P33LSJCq6O2qTMXkWxHHoXry14dbq1POG7kgI8cODy2bxonS6AzpLnFoY5NhWI
	+9CbZnD18oEizaONzi9vz6Mwb18RcmGnXYWBbc6OR+ev9T8VLLFkM0Sju0O690aBOAwHxqKkIsz
	df2aQdcvnvuhrbKgwDrdzfFBpmoiOth/D73aVwil4FhaiO3jOxiPif1u2dYN+kYYyZmcsrB07Ph
	CokidA7GDD3YhL8W2Y0voHDQbVQcywq3eggv3SmcP2UwWDPOei10jrATFo74vZGZ1uhXUS2k2/0
	SV2TW5hj/ocrKxZV1zWQkJw==
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr206572185a.5.1789384093827;
        Mon, 14 Sep 2026 04:08:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr206569085a.5.1789384093412;
        Mon, 14 Sep 2026 04:08:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608ef30sm415014166b.42.2026.09.14.04.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:08:12 -0700 (PDT)
Message-ID: <9e81308c-6d9c-451d-94a6-c4d860a8cfa0@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:08:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
To: Xin Liu <xin.liu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zhk3_Zy2filUWTGyeYmbsDV4fUqWB2Rt
X-Proofpoint-GUID: zhk3_Zy2filUWTGyeYmbsDV4fUqWB2Rt
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7d59e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1vdBnAqgM-xrE5tMc9oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfXwuOx0D5aDS2I
 xwpNe7f57BnDFh6lt7ERnB9bjbZuyXmx8JHsGBJlVJekiuQR5PmcmCUPC4bqQ4Bbm1crq1wGZiZ
 6+bsq/e9AOecdBPTBGazrLJCImVEHh9tc9darORpop6yrKYg2SrsR/C4TzyO6DDOsdXBewEliDi
 L9CEbztlKz6/VsbsG2wePGY88I+kRgVbl0WlVQFcg1H41VxBE6kcjBPm9Tf1uBLqCycnhn6LS9E
 gJdevz0ejoWTESmgt4yeLoQWGRO4/pOvE5ptSZVuRZRxiAqwK0hg4iF08ywtRW2ITfdtG958HUD
 slYBZmKC61Eq8YfIVuvz/X7Q7EYbmO/Q8wLaBz38V6HivfQ59UEr9Uyn6D408vjCDkcq+RxRabs
 JLHNCiDouO2WvbOfnA3xmPvdMqmLZa61TQnXCG03t1RSESFhAshLZbmO8SHSv4yiZac8EAiQkH9
 E2F5y0O292DpOFR64nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX5Co0ltNT6zvc
 E4f++EXzm4IXYsWASm3VmKkmNQc+8kYM4UPs8Ulw/5VI/9V2mI703zG7L2DmP0413aj1hncOgdb
 0EpebfyNu6VnAXu1v2gOH55HG2SUgE4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140157

On 9/14/26 12:12 PM, Xin Liu wrote:
> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
> 
> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
> their stale "Left unused" annotation.
> 
> The FSUSB42 SBU mux chip is present on the PCB but with all signal
> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
> group. The chip is retained as a hardware fallback: should the PS8830's
> SBU path encounter issues, the FSUSB42 can be activated with a simple
> rework, avoiding a full board respin.
> 
> Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +&i2c3 {
> +	clock-frequency = <400000>;
> +	status = "okay";

In case you need to resend, please add a \n before 'status'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
