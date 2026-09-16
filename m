Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E6449E5EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549822; cv=none; b=fl5hO3lcwQiycX6116CeywKIjG7QFQWskcytrqgfypKFDMmVpjQEqnn0SkEHVqCvgU0scVOz6PwATlTTgXQ/Ss6erXeTIcrUcPR4c5B3uOvMV+FeEdug5dmlMEiKkbX5B5qJK23t6e3cdyOpgdM2PFBmR+wQSXKKkOf1RvCdZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549822; c=relaxed/simple;
	bh=X5pF3A7h9wkn5uahSdbhngWdpSiTYJvZ0s+iTq5H2Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEg7qpOiOwhTJALJZrFn7m9LUJ5/7iale3c4yF2gl+IYbAaqo/fb6XEWU1eE2CU/PHHGuEYWsnz6eTzhBMEl8DOfli4sumZAxvirtLIHQbhD3Y5PE9PatY4TVNR43ETZ2rpr39QSWWfbkat+eg/r4in17bUGRilCmfxXmgZOE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f10QwLbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YD0GW8xT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f10QwLbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YD0GW8xT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92pJV3377310
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1NmUklAtL1cxikroewbZT51l
	w6No/wycIXEfydBGSgE=; b=f10QwLbF6UnpDxNXkivB2+dPWQB/yGSJ/BpBsQb2
	hXEbWSuCbmn6g5x++ILtUj60VR/hPD9AaCTCgEnbTFuvNcfikaFCtTrhTOoAzTs2
	FYoIyW/c8mb7l2P+PS8tJfu3vrHZcVe37p8m+6udDzPVpMcya8tnakA/i0msMUG+
	lvmr3RCoP6cbl7Fc0kecAfnr6g1VWcJKSRr++OUi6E8pW4m4vX8oMSzKudX3Wu2S
	f7R44FWlBGdlr//8kl7ZC3PbNjt42203ThqDvSFKXIBkO3qKxeZTMJYrOFVdM6Ci
	hXFfRZkFo5P7ME6uebfnNZ43uRL8QKnVkwMjsRPU+P/4wg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpaar8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:10:05 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c21c2859ceso2952474eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549804; x=1790154604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1NmUklAtL1cxikroewbZT51lw6No/wycIXEfydBGSgE=;
        b=YD0GW8xTvoJM1JE1q9FdfCX6XYsIy9ViBikQiAIm5LUHzgE12gvyEVmQTaK9BV00rK
         wG0HZ+4dtqX7WRZnyL5xvf/kgEECQK3kEE7cKkCjCaNTX9rmIaHupYooQiIixOn3mW5N
         WHROn0lFzY/DJOPr+cR1EVxJ6uwmoG9FfZfCPAVmz9nI0MXBS6fEnXlt+YsiCvRcdk6X
         TYCikKPuopeaH4xoi3UwF6Tyv4MILRexXyupeM8lcoWvxUEzIOZ3Wqcb9+AfU6TUgTQH
         X0z5qUmvyf5G/3YAxbhygUrVaG8nnEFRn58f0RcXa/fJ0W1XQZBRQ3ioThwPydtKx17J
         U51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549804; x=1790154604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NmUklAtL1cxikroewbZT51lw6No/wycIXEfydBGSgE=;
        b=I8gFM7WniBwUVMYphX+GAMe0tIEmzwhgTqqNOVredVJenXxVoLFz2tgx0O3o/mGl6w
         wBp/ijlaknOD9GnHyJJ80CBxxFomF6hemSAnW1qDbY8igC0zU276o4iA8Otal4pIRWuf
         phFs+Q3+Pj6XFbiTt5YhkOpSslVZja4kCR+KZcUh2bCe1gh2PEBmgLLma9VMjCHRVcwm
         djI+38INeJHuITZAdHF0ZaSAz6Dp22z7ocyLwiKlvrDRii+D91MpENAFHylo3M3RGrIs
         iaomw8NYI0Ney45C6yl8uGE9/o+drbd3FDZctMmuQCUsn3K32IrPE9fc42WZG+YRpc0Z
         ZYKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0pH4MWHQg6DMQXFbKe+fi13rBNSmvgatoI7Ujzb4VucJribqz/CLxuiLuBDmpN4nsXLgb81ot00n4ca+o@vger.kernel.org
X-Gm-Message-State: AFuF++ntuwpyeT34udwj+0KCLuO/7NwcmGMXGkwYYjL7L1nw4YUS6aG4
	5BNPODxFqk2bdQwvU/AT2lFH5OsQ5NrFPUknSIcLFOS0IFpVZ071AIMDFqEFrlbL2jZHqtDJSrO
	Q71vFfweRe4RJQWCMM3AhcCKRVWX9Z44dcNCzCHwDO3bccHIyUCldJrNpJuB3aEB/7puA
X-Gm-Gg: AYBFou1z6UfJqYwkIpb+p3qD/uEaN9m2RF+qzN88fK3cAOiU3DSk+X5n5D+de0E9j2K
	s72InBG/ElaOzjivbvcr2bBPxy/vxLBr6krPdYt2LzRq0fWv165eFKmMvH8iEN4CeDTbwCPzFau
	VancUUr38Lmx2KUSWfRe1DBvis7qD9s6l7FYGl0uXyzuMci1B/jzT8FR9c5pmFvqIDaPi9Xog4X
	6YrbHzl+b28Pm7tQRpYCo9BN/SyZfhydrykPm/Em6Zg57REzyD0pj2uvPP/ZlXNyaCgsuwcNvjL
	LkqFut4+aWLNAVPyPxcE4HW45zSHSn4RSvEAd6tgKBp7qj97Y5ztFClWW7sLN/s6Q9VLGkjmA9g
	dbtjIkYBUuY63D5bmtEczjAairZ1eHtr87qOftzakybE=
X-Received: by 2002:a05:6820:180c:b0:6bd:e592:2c74 with SMTP id 006d021491bc7-6c7d45ed069mr1787690eaf.55.1789549804416;
        Wed, 16 Sep 2026 02:10:04 -0700 (PDT)
X-Received: by 2002:a05:6820:180c:b0:6bd:e592:2c74 with SMTP id 006d021491bc7-6c7d45ed069mr1787671eaf.55.1789549803916;
        Wed, 16 Sep 2026 02:10:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad9ed5sm6791317eec.22.2026.09.16.02.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:10:03 -0700 (PDT)
Date: Wed, 16 Sep 2026 17:09:57 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: nord-rrd: Add sound support
Message-ID: <aqpc5XuF8U-m9zWm@QCOM-aGQu4IUr3Y>
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
 <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
 <d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX6t5+w2Qb/QRv
 9qP2JC733I2yfyYCCUc66bKUcaZJoqYFBS4WX3Y1OmmVElCyIfszWxiiJftkTHdpoSkd2DyfxFn
 fRCHFEOwa3pxVR5hGTCuUjtXYuNM++w=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa5ced cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=K4Jvm2uu9IkAFHIyoRwA:9 a=CjuIK1q_8ugA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: ZS59yY3K1UNKQYhxnxVZfyiaV_1LvTKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX1I78C1Mcznd+
 OYcsFWkNFPIdMCFJqmuRE+7vmAbVxhYBCGVXxmSYqA7EilwgBrhom4KT3g1kCglVtqV6IbUwhLn
 FXEvqLofMRysyGurEXiADMa4BZ6GjwZriIfD1IbuCRfD+LUN7/VK5ITSB3Kp4/2/aWfK4OIuXWS
 uYQXER0/svWEr/o5DV45LBePJV2UmPGhh7kBmDCrODgl864skP1SG5ymhzKssbpLGxw6aXGbDXv
 yQWz0c78g+pM5U8t5oofr25NwafEiOSZcJoepo6AB+72US+TO/Sk6jj+F5XBHNSSlO/TngP/Ada
 nsJ0AMrL1zLsmagqaQk1UXAtxydpRMC+UgHjvIz9SwZoizaM9Q+w7BOg6Q0dFdxcFHiB8sUBDMe
 BaSORNCIUOmApaLXrp9biJPS7QYNQuXY24EZ5nxTHTgl3K3lZ3iRnYsfcrp1FaCyVOQ7ShzEtcf
 VBDCwdjquJRuk9uvG4w==
X-Proofpoint-GUID: ZS59yY3K1UNKQYhxnxVZfyiaV_1LvTKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

On Mon, Sep 14, 2026 at 11:01:36AM +0200, Konrad Dybcio wrote:
> On 9/14/26 4:40 AM, Shawn Guo wrote:
> > From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > 
> > Enable audio on the nord RRD board. Add a soundcard node using the
> > qcom,nord-ride-sndcard compatible with two DAI links:
> > 
> >   - PCM1681 playback over Tertiary MI2S RX
> >   - ADAU1979 capture over Tertiary MI2S TX
> > 
> > Add MI2S pin mux states (data, SCLK, WS on GPIO 73-76) and the MCLK0
> > pin state (GPIO 99) to nord-embedded.dtsi so they can be shared with
> > other nord board variants.
> > 
> > Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> > clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
> > expander on the same bus, so add that too and hog its dac_enable and
> > click-pop-mute-n outputs, both of which have to be asserted before the
> > DAC produces sound.
> 
> Sounds like something a driver should ensure?

You are absolutely right! We will try to control them from pcm1681 and
simple-audio-amplifier driver.

Shawn
