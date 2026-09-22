Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5484C8FF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108591; cv=none; b=qgH288oTUQzVcVdTPvQdXdb82UbsDDkA2Xlprm3YDnrd/LechOJa5yFeGp2DrDCk8rvjFHZOg0vZAjqpp+Wv62MaTvDDiluAS83niyXbEsK4StPZqufE2OWqM/Wq/Y6Ho/wKXpvOa7/UP0dgW5//q/o5HcxFQeoUIrWakuMG+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108591; c=relaxed/simple;
	bh=riYamvsVX2oKQRx/xBDLH39QziKxI0EWYK7OjNxVRDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdAyHKdaWqNhvRMocZ2XI718bfYkeT+KoON0lOHVQHwEeKwXv8q4ix5LHoxxgC/mszwtlbgeXZOJDyEnvtQ0HpTEmQ+u8If+UjNv0QFLxkvwjhjYFXA5y5TUqhRl/k/RZvm3i1TlMudO570DUPs2zTcSsKx4y5KG7aES2hNF/eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqxcTDE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kl3hFeC6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqxcTDE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kl3hFeC6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Cx8368035
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8htKgBaDIdBPsyrAeJXC/gbT
	CTAoJcyryDOr9QBMzvk=; b=bqxcTDE0j/q1DK4LnyB/VLFYvXXdTuMOY0MjQ7kq
	y1Hg5NAV4XO6jXLDNYtZ+lBJlqxd0DO4uxLNvy4vYbKYuHcxss5KCJAmevvC9pzv
	500sDSIX8D8TgdcVCYEEkOIV2oJ8ma26HmSCH+b0ix4ck9w8zxQkrGOkOZgMzE0w
	ldSkuH3pvcNPafWJ0F+8sXl1CfdAmKXdh4RnTNYBKGlUcpPgJFpduG1TzLNkewAC
	wzlO6/6q3Ee6ZRKIH9btk7WVHCA6Yh55+M+Jp2nVGZk4F+xNHwdB5QVqtB0zqmrI
	vMlaAOO0IPA0Jl8vhXwPlDQkp4ussLGcO9UOWMb/4FqgtQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntar2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:22:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7b0f8e40bso414855e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108571; x=1790713371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8htKgBaDIdBPsyrAeJXC/gbTCTAoJcyryDOr9QBMzvk=;
        b=kl3hFeC61t3BuaJc6wEu0fOtsMnFirmKYvw6zV2QE+WdKVdEjmNJ1avd7tStbydUPI
         zeVOreaVXbiDH0z2qvu9OzFrxpjazYCVTuShOOh2ocO4Kw22kVmkNZlqRl62f2H2ERbh
         zUBZ0N/npi/1umFzLlQWjXO5pGXBfJckzHuol1yvLL1Ul+gM9GWWoCD4GbRRtZqscorM
         oHV1Zx9IzCtLglWeEWXeJ7UycX4ZaMeVgN9FtCQZVDqoBMI51N8T2tCjlOAR/0fOQk3k
         tHfoXwVnCBxoFMFt/Iey0QdIzDGY/hawy5BBwOZRfqJWZjsz7QYPMeP3FF/0R9aK5GAr
         X88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108571; x=1790713371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8htKgBaDIdBPsyrAeJXC/gbTCTAoJcyryDOr9QBMzvk=;
        b=scnOdiA2gTz43Sbm71Qqwot00dwga9bLXWmNAgM3hsKLIXTeR5RO/OUpKKgH8JzVos
         SK2GQX4Jedqk3u/1RqZ77VjUVS84FUhdqcKGDeTq5qQg7haR0dFi8NyzqXeB5P24y+k1
         jW9p/5gm0y8zb3Q/F+7L81i7TFOqb4WxMckYDxDt3R44GWwp6iHKbRKbcuPQpK0YT01m
         BYCSwBD3GlFTohqiwX2+FHfujM+JAQMcqpFLe4WFP6DYLzY1jMsI9F3F0SHyR7Pz8kwI
         4RAkQvXzwB0PUrMU2fDQDQKoOxBC51WN7n+cS/5xBvIONpnfRUE2GNMzmUXUYPu13SBW
         0YJw==
X-Forwarded-Encrypted: i=1; AKwUvBzwSs6vVjJxOB/3SkhtdlYLFxnjN8i3GLli6z9EBBd9de0fX/QKEg1NKRwUN8l/XsvShwHuZaGWXIIkYg9A@vger.kernel.org
X-Gm-Message-State: AFuF++lN17O+V9jklGJno7XVKLx800vpPvXNLfnya0KbApJd3xaNbirO
	h5sYnmuvU42Dk8E8HrN2ORmH89wjarh1TYr3tyMPLfKeVLxaGwc6ccWb65kf9+b7ZVhL2RrOW3O
	bsD7OLbR8QRFEnPP5zHOdhqlZ6dBg3qanBFYuSY1oVfSca9dozwK/E9wOiXFJMfKujulb
X-Gm-Gg: AYBFou2d8TQWAiJvyz+KdslXqo/Tpdin6e/PBqhyxt+uno/+k8K7uKLc9Hw9+O9BgYw
	qDeqiq/avu9XOTfmKr2knIKyjKBmUjnTIevT56YfShrRAIOS89gqjjX38djqhC7aVFo5CtLmHh4
	tjALGHK8SOWTjjcH9dp9WlItUnZ2rZrLFEH2CCfl1neXrP02aTNm1uLMXMPWqmlc1Ea6Peybr0k
	+n8t7GF482Yt2OvkD7bzV2/E2t3wiI4Lzf/CXQQxS+3w4uBkhXTHG1pamZADPkoKgqT1sRbB0t2
	S/a16x6Os9cJyDolAxuv9Rsw5Yz0cHZcHXYr7pYp69b9tG654lk8nkzLKXHTd0A6c63LG7qukAK
	YbDW109ojWngFhOc=
X-Received: by 2002:a05:6122:179e:b0:5c9:c60e:5cf4 with SMTP id 71dfb90a1353d-5c9f1684ca7mr1189851e0c.18.1790108570691;
        Tue, 22 Sep 2026 13:22:50 -0700 (PDT)
X-Received: by 2002:a05:6122:179e:b0:5c9:c60e:5cf4 with SMTP id 71dfb90a1353d-5c9f1684ca7mr1189793e0c.18.1790108570226;
        Tue, 22 Sep 2026 13:22:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486461sm885650f8f.8.2026.09.22.13.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:22:49 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:22:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: Skip get_bw on QoS programming
 providers
Message-ID: <r5oa7d7rrdcenoiks5efex73huxr6mzpqkqjt5jlgu7y3rdb2m@uqak7vhuucf5>
References: <20260922020623.398913-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922020623.398913-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Pc7fbQ7YhDA0zLK_anyjYed3HJNgw0cM
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2e39c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bdokXQhzV7AcA4co5KEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX11CsIu55t/mj
 fW8xUijKO+HkPWmuCYak+nTcxEdAGYFId3BBeQLUvyuPzHqqZiXxmiv1u8TYcYPcTbRs3jJ9M7Q
 JMKhrEzK7WCHc9lUvpeZvXKF7aONEN/wGQNirUWXB1ESK3fLBqFJmnCUHxlJ3f9dl0LxkBO5vQw
 YCAadcZivrtumju+FGNrV0kYjDvHC55ILGXWI4+mUOzGRXy8/a0mfvIl/gJHL1DZoQ3fNXnoIs8
 lJ4h9SbM8ZLrdjOhe4Qh5S3M7X2VYcVYuNGDvjAX4kYygjTtSF2jBxkq2ccsrM76KqHhKaSdEA0
 GnyO9+ds1lrGcrHl2Fv5/5pj6m/7Vn1F0wJjvr9wYF7xWKmJvbz1G0+0I6qifc5witBcDH0T79l
 nVGKUoSRufEHiVA2/IPWO5HPTZOhRSScFRweGJnu7VTgupX/uWbOTaU7L8mQtKnYTFMbea+eoMZ
 le0tNzu2qgJagcPsI7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfXyL7QqThzDYus
 RcAoGBgfbadh2CzpT+yP/Zm0jy/UlemL2mXiyoAzZm/GCzjphmuDysCQWT10KS4WxWvHYHs0xdT
 A6Pr6ND/FBf1CeTy13Kv8HAxreIwSwM=
X-Proofpoint-GUID: Pc7fbQ7YhDA0zLK_anyjYed3HJNgw0cM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 10:06:23, Shawn Guo wrote:
> Programming the static QoS configuration in qcom_icc_rpmh_probe()
> touches NoC registers directly, and nothing in that path clocks or
> powers the NoC first.  It has been working only because the
> interconnect core used to vote every node to INT_MAX while adding it,
> and that vote stays in hardware until sync_state.
> 
> Reading the boot-time AMC votes back from RPMh removed that implicit
> guarantee: a NoC whose BCMs come out of the bootloader unvoted is now
> left unclocked, and the first QoS register access aborts.  On Qualcomm
> Nord SoC, the MMSS NoC dies while programming qnm_camnoc_hf, taking the
> board down before rootfs:
> 
>   Internal error: synchronous external abort: 0000000096001610
>     regmap_mmio_read32le+0xc/0xa4
>     regmap_update_bits_base+0x64/0x98
>     qcom_icc_rpmh_probe+0x44c/0x540
> 
> Only install the get_bw() callback for providers that do not program
> QoS, i.e. those without a regmap config.  Providers that do program
> QoS keep the previous INT_MAX initial votes, so their register
> accesses stay safe, and the rest keep the benefit of honouring the
> boot-time votes.
> 
> Reported-by: Bartosz Golaszewski <brgl@kernel.org>
> Fixes: 11a44c6087c6 ("interconnect: qcom: implement get_bw with rpmh_read")
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
