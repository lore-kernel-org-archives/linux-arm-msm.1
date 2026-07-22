Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF1B2BF3D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724056; cv=none; b=I5zWQoq7jG/Sp+ClX//H2OWOHI4lhJwBBNs2jUd9eEpNNftB3bBGbIVNGP/gPEpBD5/tFuBp04xyW9FQk5OvOcQq56qwOW1F5tAONocX0x+65K4bKlkHI9Y89C7eVGjoTbMhTyFmYih9Gi3luvv3xcHznXy8XQ6wzpgFZKfJJmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724056; c=relaxed/simple;
	bh=7ybZsVcQN64VtM6kgc/F/hu/d83aDdEImhyAoeKwPlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzExrQmwZlsAbeQC7KtuB+KBHZWNK5VG+gRmfMEEoP8QdRj0ix/ezSZds5mFOlgd4HzRwv7UMZDmre8i/94JIE58kKFrD/cWfGy0LmukHy+KAv5/hskPyYOBCDoRKbDUIRvZPhoqXfz20xdC3SMZjcCegag1lDuc8BO5oQrSLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr/yTkBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dB3qbA6s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr/yTkBA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dB3qbA6s"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xOE6238226
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k6+d0wKxA+NLdRiQt417IxkZ
	uVWKl6XVknCHTu9Cguk=; b=Vr/yTkBASph8kTlZx4WQR5MWM5tteIr43lCw/+mt
	hid3Op6tnftnY5OYILN3uo7rGNZhJdFLimmsqrR4uTlrzWJV1ThQHhA/SPIMUCIb
	p1RHFYgLgtu+kZqafZsKQflzFe7Mb8NXcLhHs0Hre2kKhlV1w9YSDktMh/BtCtvh
	47odtlBqey9Rdq3Fw+b41wLRTfMonYK5bjvBya4BmO+QMsl+1A3DATDC+1gUUhQv
	GoJtAXfWLa+xvgw6CMZhJVShQw3yRHSlNPYVZzvNu7i3DpmeQkJF88jLhnHxYBwy
	Bc0MsSR0AZiMwQaq6vvIvk6gXydr9jxacuTTtGdIO9wDkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn25tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:40:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso29547731cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784724054; x=1785328854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k6+d0wKxA+NLdRiQt417IxkZuVWKl6XVknCHTu9Cguk=;
        b=dB3qbA6s/2OtNwLAIvSnDxrqNo0i5HALyB6Tw2fmBj6+HQ7MZmPxIXRzYqAcM/bCde
         MJbVGioT/5cBMHcfVvalvKNgmQSG7IkKr772m6LdZ5jFp00yygRXRSRnU1JnLMp0AoK1
         aOVTuOEmbUySKcSeHg3t7bkK83cpj2QT06II5AwUnIJOvstRV9+DXKcSYDLX7BsIfsB7
         aINqxFSJp2MWIE6z4whcuPx6c6g/00LCtDA9vlqppfkFUW8k62zMk0/e0rwqM7VgLnrM
         ZzKoVxJ1PwLFx3sjxofjW83sxmUZxo6GXVAd11zd08rKoWNBtQEiDtpay5H9rzvCBdHK
         7B6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724054; x=1785328854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6+d0wKxA+NLdRiQt417IxkZuVWKl6XVknCHTu9Cguk=;
        b=MZsy2tueLGDKaU81Vyjg6ECVq/HmJQdksR9GY5ssLGn11AnjEIJkTPj7mRqjUrJa+M
         PhMUZiP+gSd6brORYFny0w78+KrrEJvi/i97YG2FREpI4oFxTGlGDPdxIKyk58bEq0Kk
         d96Hy5M/STtgKeCFOHrupeSjYZUc+QndDVvXmF6kgZHf1UoMfDfvmXrhfy9FTaPaMPc+
         qHsJxYTRJM53kQJHxIu61BM8GNdqDTPKWL9xyHEWHF5szpCtihtnITWu6J8PkStvd2q9
         JbkpmdM2mAFBVMB02yCyJ3YfZRSj1r9HaWtFXIzR1eB5UrpsbgGrSeQJpsbqWJaBU5wq
         AdgA==
X-Forwarded-Encrypted: i=1; AHgh+RryK3sQI4XOTqC2ArV5E8BMng4uGGgZOX9HKFvmaUqjHXQUOABXExCBjl4L7XHqRdCdxUNHKtHflXY7yvn3@vger.kernel.org
X-Gm-Message-State: AOJu0YyN509LpRwWHrKhCUC7Pb/CLaSvbnqgd07kt81kEcSKldXKj96F
	w4qriaopDb441blcczbVbuGJQ+Gz4zSR705yHQVVbTSipumMehWethOHbKZqdtXGpKOWOFCZxZU
	W1Z4wuivJV2afk/0OtX/X9ViBQJ++c6CEl/2Tw4E3gAz+UPct0CB/lxoYo9HJDwUCv9Z6
X-Gm-Gg: AR+sD109W2aXfZ9pgoA2MaA6wbwy74vI6Gsze0n7pISELp7l/olNTdoc451XmS4JqqI
	ai3J9/LI8TF4U3ujRSA7Zm9DX1M3wXFyPSm2qu0JwTy3arnQwwC1VU9AixOMgfP8Mm16A0h1raC
	ANgT5PhU9lAHa2lNMIU+Ote+L/VxnJrKKYqMV3y/nQoZoLDwYDIrWkAAs/sRC3M3Rtkhix1Q35Q
	plzYnrEvm+c6wFsu+Ulsgsw2GuqLxZ1by9iYoihvIu15S7MHxc/eRDUpqH0jSfzmfTRRGIzVUms
	HBQWehXMjvY+RcuKJlVDmpfVdozmddlqH3DsVUjUN8o128KH5siKUw15DWC2oqyfjpK6ozBPM59
	8iClU/xIsgxW0vi2v32GVR40E62gQl7r41HNUFDS28czwGueeKnvjTk60lPYklVCfylGt5ES6g9
	6tj0hUr95pQ4xVRg==
X-Received: by 2002:a05:622a:a0e:b0:51c:1ff:2515 with SMTP id d75a77b69052e-5213e188477mr222599081cf.65.1784724053680;
        Wed, 22 Jul 2026 05:40:53 -0700 (PDT)
X-Received: by 2002:a05:622a:a0e:b0:51c:1ff:2515 with SMTP id d75a77b69052e-5213e188477mr222598651cf.65.1784724053076;
        Wed, 22 Jul 2026 05:40:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f50b18sm448070e87.83.2026.07.22.05.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:40:51 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:40:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
Message-ID: <wx3t6tdk3dsgbfe4rexxdekbhtaryfjpf4dkwscyzhxnnsgzdo@qnvhzfai75nx>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
 <df914537-52b1-4968-b65c-cdad1115a661@oss.qualcomm.com>
 <ljec46njfs4j44x7xcmzs7lxrxwz6pm6fymnkrvvki3oxy33p5@pqewduuy3l7f>
 <a60daeec-7cc6-466e-aa51-a6f4aebc8a3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a60daeec-7cc6-466e-aa51-a6f4aebc8a3b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60ba56 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=GxFIFeY6bcelL4jVc2oA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8anrpVaIKmJ8Qsj_ebEf9P9KFKLlaDYV
X-Proofpoint-ORIG-GUID: 8anrpVaIKmJ8Qsj_ebEf9P9KFKLlaDYV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyMyBTYWx0ZWRfX9dvj8wwmLJbc
 jdwZJ9aSN/9bdsKCehou6sn60ajtrKHTY6tR+fMQfpFPU+xfPb8MGQX6yP6CiASeV/VBEhnoW6/
 836JDNjinhhhHAjhlDTdC8pDXJtv1Go=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyMyBTYWx0ZWRfX3c7aLDC0WpJd
 VMQN9GT2hPKUHz1/w+NoLUUUN1LIvt5iWshlCZeuNHtSljO1mq/lC3zqKHhyf+agEpCRmOkgUjv
 wgP5v0x9WqSYNVzVJhPu9tiWee9AE/eaRwX3fTXs/CBz+vYzBMZktD/ppHdwsqIJQ5y+cbeTejF
 zr2hqKBugnSq3seDfweqX6PkLrOsK7MWec9RkCbatPU9aQ0+hZAplIcvr/JUTj4RsU/AAZ78wrs
 bkFqn2x7MeixHEVXarwmlAIZBNJECZ6Mxux8fF4yPHaBDG5srxCnWMY9E/avwfW/GQNp5dz/XyS
 NHoGXDc5zn0yOr9BBDaYv4yDnnJI9ICQrE9LisrARwwj2AZwUDtTNuifpr2NQTL1z5DMzJm5OPW
 LATgjJqt6DAoCvAlnNz2PM19yLCoLRpdfeuuXwhwP3mBFxPI8YgA4Ag7weK+lv0i8e1IJZTXDV7
 T+K9xMSkgbK3ohj1AmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220123

On Wed, Jul 22, 2026 at 10:28:44AM +0200, Konrad Dybcio wrote:
> On 7/22/26 12:22 AM, Dmitry Baryshkov wrote:
> > On Wed, Jul 15, 2026 at 12:01:42PM +0200, Konrad Dybcio wrote:
> >> On 7/13/26 12:25 PM, Sneh Mankad wrote:
> >>> Do not mark MPM device as power domain since it leads to idle-states init
> >>> failure because of probe dependencies.
> >>>
> >>> CPU cluster power domain node is kept disabled and hence CPU cluster will
> >>> never power collapse. Do not register MPM under it in this case.
> >>
> >> This is only the case on the RB1. How about we fix the issue instead?
> > 
> > I guess it will be fixed by the MPM timer being programmed correctly.
> 
> That's patch 4. Can we test it out?

Yes, with the patches applied, cluster_pd reinstantiated and set as a
parent domain of the MPM device, the board seems to work correctly. I
was even able to revert the I2C-gpio workaround, the device works
correctly and can reprogram LT9611UXC firmware.

@Sneh, please post the series, including the fixed Agatti DT (and
deletion of cluster_pd + related domains from RB1), I'll respond with
the Tested-by tag.

-- 
With best wishes
Dmitry
