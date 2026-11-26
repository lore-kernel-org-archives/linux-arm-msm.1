Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686894;
	b=2Ll34ZEAFJez3El9hek1iM0m30kwfWi7GJXXFFw95mmWdjJ5PTTJ58mYZ//k0Nqjgxpa
	 XpEtyycrAedPobgjlA4f5ACBSfr9l6llibo4iEbHj84L90I0eZpYibJWKHHkYwGNGmyYz
	 l51UyB7WtxwksZyraeiFNoZHKNw4UWdkF3p0tcqJrQTr1fX/zpXvhPuSe3AUKmB0q5gAk
	 APsPXoLcKoKcfdAYfBZkSLJ0eg7Jf9pkBABV46evjUCHWQlo7fSyfjr2WIVrWaseFpyPo
	 tZSKjYdN4l9nSJ4Kh5kKv++OJaQoNisTQl1Iv7Denf7/XcR+0Jx+OgoLfPjGWKW/2YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
	b=kpX7mjEIgMAWF5FM07suKQ9Xjt2xCjaZeYUUg4K4dgFrSIpEzET2R7MSqneZM8G2UySP
	 TK/mA336UnvwXoGljDAAIIL0KM4BIHzh720XDHbPhmQSh/fMBI7g0z3fPtdW5tXdOwzWa
	 KW98QRZi/JINvzJHfoeThXw27rYvWjhRcwsjE+FTiXoqXHzJCgr4m9mUzfFZr0yPj8kZ+
	 fHbI25AlAdFbHxn7YUN2ZQzx4/O1mNMnrOhQoVBipmB4ROYQ5Llkm1t4+vugmz7WN0nU1
	 S7L6cIzLxB/5QP09p5CI+r23573gTmMsp2PwtBkao4K+E5YCyVgxI7mKz1mI/4ITbzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQFc0EDi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JeAEFP6y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC54606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC54606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQFc0EDi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JeAEFP6y
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4Xn2595120
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kdx3A01MCHfzKvhg6F0IDQCh
	+hcLdzZP3RW8GaIG51Y=; b=hQFc0EDiTPqXE7kwdzQTEPaHnmIXWz979peW16gD
	O0GOiYtjeORCvlpsScpsJkTWRMOJqQWkutpOfsfzli45j6SaydbSQJf9bmxaHBMX
	w6SCkc0Ty9t68lnVBbx27juVGfv4V6xMYGUzVKo5PC8WgFoCAhVTEMCmlK57Jmxj
	b/IR6tF3fto7WruC9oZmpwbU2u/2BLHA7uo11udqhO0YjKRX+5lW2Q9RIRUrT+gk
	4YLaFj6oNh6M5yaCd3HokghKd2UdFt5xjZCtxlCG10RhusyUXsr55VCc8vx4GlkY
	u2Bj8tzOj17i3WWbIOJHfe57ZDitnXRVqiDd1l5iG5Jn2A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sajqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:54:52 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b56c696405so9387573c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 01:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686892; x=1796291692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
        b=JeAEFP6ylE8rXHTIvD0QRiEWN67zOk9bEHakf6vMrijmjLKWT3wQ+yn1fIiWPlNEqo
         mYhqIixu0MXzvg7wXpstgXLXUPLwKbBzKxU7DcNRinV9esLb2wMLnLpK8okOI35h4WKr
         AhuLO9IukBfzkAyFuipW1cJl36pSfuGfQJrgWB+n3K26Jmeovq9DB2JiU0qNcti7E/MG
         u3wqsQfGbKQMN7b1WR7eCBK2YHm8kRBIyYxT82dEhBUR3CgcrO4j2aV/nl9Ey2tuV5MS
         P8XBfNO15alpxa4cxHIhIVRIOMQDBDsRLmXO3COI6Cowz9M5Q/VA4s1OGvxMMtsBLXGk
         iG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686892; x=1796291692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
        b=jTCDU4KlqTZOQIc/PssmfIqJnVybnLJXjobKq3Ijhz6FO2y42hXUtOrkME7RnGll3/
         KYgqkE/YPrgbVRSTekbvI4nPy0ofw/TfoSRBI80P7tWy/ts/URk8EJ22UZApUUXQQWTF
         vYYWDwsS0Ep+wsKgnYuh4GR4iqKAxif1JvXsrngf/uL5YKao740t1Y88Q22jCkLkedVf
         9JMKjpds8zRbU/IWbfLYUnlFj+jwBfLKo7XKMwlCiavEGf2lYKeLNLExlr+mAKAw0rsB
         nxQ1nDBJVIEF7YRRpSYSMXtBtepWMJHqHuS/T/syJnTsl3tZ0sK8beK5toMVAQ9kqPdC
         7F/A==
X-Forwarded-Encrypted: i=1; AL+hErFe1ztTrW1YzAuodHAm5scMc7jqXzyFlsqtl6VQ8u4MSVgufOqSCXaor8pRVq2QuyTH+ybAshlWOUO1mUU0@vger.kernel.org
X-Gm-Message-State: APuU4Z/xNEUWndOXc2LaHDDbM8A22AUkCNWViWA7T37h9FCAreTwN/Lf
	GeoxILF4U6VrEf0wvXjmIv6qbBf9tlZlOedK2bVM0JM6TyRfgYgNAC0v9RJkmnPrln/4IRNoxb+
	t3dm1FdDHEUaZ1nE2/W0gIKgp0bO+iwG+IbJISiG6l4t87Jg8bsHcZzTnD3bsVygJWuz6
X-Gm-Gg: AZFdTZf/dHs2YI0qvj5e0Bc1DvuT7ifhmt7lZoZbGYFRloavo8xLoX5lLeegpgl8GI6
	Buclp82MJcxGYBXXHZHhrTFitzNZcCZ/WwLzLlCZBOVJMbpfljjJgAs/NH7kQyOgXqMqJcF5DyY
	mNchIRr+fW8G+mjKxhANRBf29XPOVGHXRQucjjOqeEq+hgtZIy7XUNJfi+b+qdO8TTPn2c+gube
	Z5v7Mk1T+oGZUjrj2iCx+0ldgRKq5hfMq0KI0w5kpneg/E99Zi4qdZG/ba8dIx5AvNOR806+hth
	CqsJVkH4tyBs0QfXsSrFFDjuikCcrZoKQu0TsKpTpeZOQRuxwkrk2ggRX8j4s2jqywAxwgJ5Uv5
	67NRkUu/yoBBuH/Wi7FMfG4hwu3umQxG+RgBJ1Dtj83zrIlcQ8rvjcMLohJ5wJtVt7wwdlUpiZA
	Ahtqtl5Dtt96awAAkn6kCgV+4=
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr5577033c88.15.1795686892004;
        Thu, 26 Nov 2026 01:54:52 -0800 (PST)
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr5577003c88.15.1795686891362;
        Thu, 26 Nov 2026 01:54:51 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm48932950c88.10.2026.11.26.01.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:54:51 -0800 (PST)
Date: Thu, 26 Nov 2026 01:54:49 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after
 system resume
Message-ID: <awgB6a2rwB1auFpQ@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b0801ec cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2q1QCJqqa6WVGGjbUB4A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: QoTQblGolGENSAHq0Lo3vjg7n4HHLTtD
X-Proofpoint-ORIG-GUID: QoTQblGolGENSAHq0Lo3vjg7n4HHLTtD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXx5MKuEfWOVGl
 9U8nl/tqyZpsVc/Y7E5vjw/GInmrEg5Nc4YRvGSZ2+Mwh29LLCSZrypJv2uyL6SVeE9HU2YG5lj
 7pyV2eg5VgI6maeOmfp2jUm3yTRbW/Qst+2Z7YURWitRMOXy5PuNtfLd2LUYBsyGLF+2lN15bTq
 nGM6zMHf2hL1W09LLFsN0WT4rCZAp2XQusUPwsg9CXp+KF6uzbxo1PqePlEVZNNSM9OkNO3cMBB
 YESl5onVlpEKBI6pwR6Vim2vx2OX/fRtQZMaVZiW3BXVD1CI+VsZhiOlo4MNlpguqbkDnlkjq+3
 vFvOez1dLYQnlt2DPeQnO8f+yq1fpFIXvuClMUHm195ReKH1tjEj/WyQvWHDz0owCLJk5dCxKc9
 Ml/o1P5R4XNWLpOOhqaSg49kPNptMK1EltdOEjwQkJWhOUFL/wT8pDdoWRTBJdvfGbl7sryuJ1I
 XqEz7chEYh5ZtPjHj7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX/vK+9GRIpzyQ
 dUVW/iy1g8YaGES/j9xImztqPg5r5i+X7mrE+fofecVqubCat6fOtMYHnuQipxnbmLsYHgdD6Hz
 k/v6w32sbSCCwGXw5pEjNrZsPalT2SI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 26-11-23 16:17:23, Faisal Hassan wrote:
> The controller reset on system resume returns the Qscratch registers to
> their power-on defaults, which clears the VBUS valid override that was
> set up for device mode. Without it the PHY does not see VBUS and the
> gadget fails to enumerate after resume.
> 
> Re-enable the override after resume when the controller is not in host
> mode.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8e8d7e59c6d5..50fca06c83d4 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
>  	}
>  
> +	/*
> +	 * The reset above returned Qscratch to its power-on defaults, so
> +	 * restore the VBUS valid override set up for device mode.
> +	 */
> +	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
> +	    !dwc3_qcom_is_host(qcom))
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>  	qcom->is_suspended = false;
>  

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

-- 

Thanks,
Peter Chen
