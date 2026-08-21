Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54754412C16
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294090; cv=none; b=omdvaANaTGnbtfx5tQRFK2+Sa31QWbhi82tIGCXTvo/dIY+VOqCApw9YlzDGC753a6bk3Frt7ijMfu5KhTMgagakA37Q30FJN8AaO95GoQ2PnfJgc27IbEdb0lzzl6T9pX9+x1u2lWSv6ZuS5Fy2MrA4UZKFzqDd/dqer4r3E/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294090; c=relaxed/simple;
	bh=PTtUw1aBvRTFrGS1Xdi2jShMywNyldzKbSOrkVj0R4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOBTipKgLcVCj0ysNaHuK4Z+jcaVnMUS4Gmfe/5cNkgFa5JTv/b4SPo0fWtqGfP88GJLz+T3NMoVQPtdGg0emfZTjz3jBO5UsJORi8+MqmTPXw5Yb5RUAYghSihkA0eWtTVPTGReU30VPY7k3Q+AL03LILGqcyW/wukMZj7vI6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQHdeUfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFEOiXPG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQHdeUfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFEOiXPG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5TkJB1027469
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJSg8p95MkrIIUpW6qDHyz2rAmYHMQ1fjNNioDnnJ+s=; b=nQHdeUfNpfGoXYbl
	CuPMJxh5IbaCOsFc+b7yKMoptq0NuV4RYrVCoAgKFXLjFXtclSJaUJv9YSje/87y
	GK+LM6Xb/9gN22/DnHr9VEjbDnHgfPTXFQelXsWp1QsA4cNgtA3J6D/ijvxGxMfx
	9ntHvSVAC+oAWobXWtSS2iC/QyD1Z9iBHv8VVN1oEGwkgJD1waWLY3wHw/G0L4jn
	dwBa5MoJWRlbdVh+gRu4WZxFGpJQsp2AjYdl8lQqC9Q/8wFL+/Htl4n9OzCzk3U+
	ttSi6ImAZcN04AuOyzd+cWvp4m/4fESHFSAr+kd9HdfCGQ8kVYzVXWFpVU6AnFry
	zPqvLg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6d068vtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:34:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so757082a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 23:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787294088; x=1787898888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJSg8p95MkrIIUpW6qDHyz2rAmYHMQ1fjNNioDnnJ+s=;
        b=gFEOiXPGVw06yPr1CxHUuP1Yuh8OkEVmiCzoURIymDPQH3SHXbJ7LabEcCsYe8CfxI
         T7J+MlPo5vbwhejcq1uJ0eYzK8QfpalPy6HV3uUAEuu8Han4K0g7y0sgpENHjk4VMlQR
         RMv2XsRG1HmKDNGKf/D7NK23E26+/BW72uS2l9BhCbnY3CvoQdrgc483/x8vv8yBl0Tc
         CK7n4uSstFbLAaQpq23S/a8Os+IknLQT9ynY0vCEhreiZgrcTNhsD3h6zEdU/a/6xrtd
         CzNiPpUwi/zmcmcuHcJMjsGQquawDo8HHIFFalJ7sMDviEYC2+l6z43EgfgP6KG6/yof
         IgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294088; x=1787898888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJSg8p95MkrIIUpW6qDHyz2rAmYHMQ1fjNNioDnnJ+s=;
        b=fquaFR7QsKRoQ8wxaPsUsoh77wRZPMUz0/+LNebMS18R0ERxLw+2N1eqimI68bAu41
         exrzhnA52/1omqRwpw5/2UtPOeNLLVfQcyjczqXdi55sbpKX66FqXLZABFyD7OEOXLgX
         ItFsGwBxI0DRQf/Th99Aho0stcmG3hlaMAgjVoaRr0JYqyH6w7cbeOATVcWnA8l6hrhE
         RdNs/DhdOcVceSYwNpDuyXgGp5LKiIwGx+HVBC/GF3NkS+OnKLO8rwdyVrK0CeW5VHou
         Rz2hQpmxkpbewdphT3ZqQ72z4oYtoSTryTpgPcdOcp4F24qDAatST7TMdqg2thxNWmue
         0OsA==
X-Forwarded-Encrypted: i=1; AHgh+RrKO1OI6c8CFXz+r40RllPRQwp43s8DM2ymW6P/kD1JOWIEDfWBFOFvJ6f4tmDMydktSxtF6A/G5AdmUUzO@vger.kernel.org
X-Gm-Message-State: AFuF++ko2PIx0dbVwQ/NIP7HoBGCkC70IVnKdx/6uPxlV6kqJs7B5PKM
	pGqp8RfGAYVSiikHfYhJOFLoJQ+RmTGC/4amrgL2CSMmE0i39naNDFZpCpOkv2HBYLAKu/HgYIu
	Ciel7mHRwSDSZf7k5w4w2gxa59RjwW/Q50559W5cGGNUla5h8rKnhUn9LkA7O3RBalOyl
X-Gm-Gg: AR+sD11coXSlxWbGm0Y0pQR4GkPC1SuW3H1CMIDRV0t/wtacp4Z38vY2q3VsrJhsaRx
	gkiLu5tGZkP5jMzY6d5vOM6cO8SJU/PqgNfEfyl7/HVteufoFAwvL9PX9DgwRoNPVDmCYHQ2+B1
	14aBh2kyTUv9bjqF7kmdTryejW/lGRXKVbbx8HB2BHLuyDb//dmjp9rtV1jsNaoO8npT2mx5fSE
	4eQiCg0iDVPlkkMifi+SLbVGIS1Sqpr0xS3BVUHEtx4bFempgtmeO7H3+7evx2Gh1s3tTRkuPjI
	/NldxGBAm2KediEA7X96UoSJGWvyIim9qx4fo0HhbwNnMewPFvpbGEF6tuqHqvz2k+JYHzEBXoQ
	0pkUZohIJOI6AmxYmlKeDPbPnzr2nkg==
X-Received: by 2002:a17:90b:53c3:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-395c39cbc42mr7831736a91.11.1787294087800;
        Thu, 20 Aug 2026 23:34:47 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-395c39cbc42mr7831667a91.11.1787294087392;
        Thu, 20 Aug 2026 23:34:47 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4be445fsm1772969a91.10.2026.08.20.23.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 23:34:47 -0700 (PDT)
Message-ID: <e2cab6c6-a5fc-43b2-96e7-f46f9a7bd20d@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 12:04:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-4-e70ad4fa39ce@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-4-e70ad4fa39ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA0NSBTYWx0ZWRfX921jNGrHKY19
 mkwRXFjHL8gmzMB5BTNOkPLsahFOWOFYE/1//KPUtbtq5ks/f+WAh/VIBx3ZUQQtwma2Z4CkJpp
 XI+1sNpoQ9Yc5F0Tgy9ZkgBK/s6SNaY2/Zy87YaSMY7kZ5B3G9sM2/mdZ+ljk4Io4FQk4rVey1k
 3HIwEmW4TBUVmvg46DpGAv1+4M8wI4BUEQcq3UCJEFHjsjbqb8imppTz2//Ivv/76l2QUjqkxMm
 T/zrNOvCY/rCOkcSbbrvp9cVKSAZ1/kxf+EO9kHh/BwZM+l99X+ttwH1GvfL2vocfxVLGP8UpBO
 GMixntINJoFsdiREXh2QObcFfDLGRbkfQLxD6RLUp2eL91M3eQNE4RdGcQTwg3vG8BAqy2enKD2
 2TIcQanJCJASw5nNuk4h2t2xeuR8KAzbC/b8JAMPa/7oSCkEbVuBjGdIo/+lHl7CyfFytqEwBIC
 V1xBwvU2S6fb7nKuYqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA0NSBTYWx0ZWRfXwy4Ap34LdiUG
 XTKwOy4T4eiHrByZD9T/TBgCK6jJs8gSaNG48b3obnyc+OVH9JNgOftHlsaBi62lA510KGiF0xy
 4cYHVKb8XVbaXy2A+XwQnweYsikB0ik=
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=6a87f188 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VQr-KVQjmy1A4l77MVwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: -i26V1tta3Duja4PvONmnwgHxzIofAbI
X-Proofpoint-GUID: -i26V1tta3Duja4PvONmnwgHxzIofAbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210045



On 24-07-2026 18:12, Loic Poulain wrote:
> +	.start_streaming = ope_start_streaming,
> +	.stop_streaming  = ope_stop_streaming,
> +	.wait_prepare    = vb2_ops_wait_prepare,
> +	.wait_finish     = vb2_ops_wait_finish,
> +};

Hi Loic,

While reviewing the series, I noticed that wait_prepare/wait_finish
callbacks and their helpers were removed in:

  d0730006dac2 ("media: vb2: remove vb2_ops_wait_prepare/finish helpers")
  b70886ff5833 ("media: vb2: drop wait_prepare/finish callbacks")

These stale lines are causing a compilation failure:

  -	.wait_prepare    = vb2_ops_wait_prepare,
  -	.wait_finish     = vb2_ops_wait_finish,

Please take care of this while posting next ver.

---
Regards,
Nihal Kumar Gupta
