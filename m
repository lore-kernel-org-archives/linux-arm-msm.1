Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4567E2C3261
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082258; cv=none; b=o3Jgc+uQH29J8ex9Hi9aUPC8yUPNP94tqIjhUMP1lo6ubLAqnYh5O51DkEG4+hK6JAWlvBWTDTf2wQgLQj21yo59422u0knFIqp9xq0g/aGUP4nQHyvyto6BU196euZMS49ynNVGNIlI3WKaj01iCF63Mu7IucuQK9PbRt6UC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082258; c=relaxed/simple;
	bh=ztVNH4vuSfVR3gj8fZ0vViL22IF/85VKkTRz2Wc8cYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6moIzKrM3BFVGoFi3dTHEL9F+GJYQ09zMrR+86dttWzhTK0wkcJzIHcWja7PZBGYUc21lnUvh/9stMJZowyolBYHZsSvl7p4O2MhnF+zbich8zc7lGM3/N5Sgiqqa/JAnNGpeqXA35x4l126Lbe9yaBtBDmOdXH+Emfui6dVhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWgIntcf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADh8Qzgj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWgIntcf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADh8Qzgj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FGb23W1596393
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 16:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZEBnHRPWcaOA/9dLapYt18AI
	Vs57G9ViDn2EaeI+nYI=; b=RWgIntcfs59WN3QZtzbBmBmwUKj6VRbjd1/aj50m
	BwVcHSlvviaL3CbhMRjymP70WkaCAyDvJgxFu9gfKAQT+yBgsdyTVxGhZhoW7lUn
	WrwtJ/IdJs+GyKzFhHgtWTzxJnZG2KYlg4bhRZeQvVqE5KbrBigmOfZoBn34YnZ4
	tImZalj+Cvq7NZEfEORYouxOHMO5RfGxBVLKJW8sGPQLQ9XpqTTHWdegvq+yi97P
	oQNNi7xW9BfarxLd4sM5Ub8VGm7Edn1KZpnIIEHJmfmeRMZzXnHeaeT/K2yNF2YM
	qedjggLhMttrn3MRABMJHL/dWThbXxva6DGxGb6Uho/USA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v9fyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 16:37:28 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so21496027c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792082247; x=1792687047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEBnHRPWcaOA/9dLapYt18AIVs57G9ViDn2EaeI+nYI=;
        b=ADh8QzgjlByxyTn+u902jtgIjeYJ4mOYFESSVe5I3IiaWI+nI+s+F3EH4eeRA2ExRP
         /MWBmDAc2i45aN6tHQYB7HpkkVVg9cdY2ldSNQV4Vtw9nU617gvy5xuNG6kv4zIFRIWt
         ToAcx0hTkwuD7/RKA4nzTCAb1T1ivMgQofLtXZWxtYlcY6tJQR2BRhDtOv6P7IdePYP4
         hn+uOe+BpWjFVruBzzS7a0wCrcPuTvE/Lm1F4aCbfG654yCtj7hwcGH9GzRzjgAD9vkg
         IA1TDcaVp24yLxS2zJvfweRDEnS5p9hUQ97MjZhyR6FQRpvy/GF7x5Kz8A9cv09ipQd0
         JG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082247; x=1792687047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEBnHRPWcaOA/9dLapYt18AIVs57G9ViDn2EaeI+nYI=;
        b=U6/o+pBzksFde39h+K32u7pG/hK0Xm7PIs34tfNeDmyXQuKodpfxpVkmvXEOe+CaHc
         hTr7z59cGXtpWf4Rmbzx63EvDcdJaFQC1j9amwPQYL8jHJpfw1TrJideIHlgYnoJOM4f
         0Vzzo7VrWOWUTjo9c4XhU2wmAs18H51cOqpJlq6s9y/HuDCaCkdCdOMXXti7kxzJhp5V
         D5XA4E/yNOT0V2s2MYIejS4u9W0sO76TVD4vKeSx2gMeZyLtCGq6ST4J8+eJHQtkDojt
         Y78EjhMfo4EV1b+a7IVZeoU9j9j/xlbuMlrQIF2MhQHOLE0+ZsX3F4zFs4eu0dKRYVUh
         zWXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnHB2btSqFVRckA5e4CvkI2ZIfrBNPHPnNgY9wil0AgggNqu5jgFIADSyGPSU/c6KQiKWoTH8RHoh52yTj@vger.kernel.org
X-Gm-Message-State: AFq9FYIGAwHWocVS6WEUDhZHAUs3kgahqs5yWTIRGU4eqGQ1Al7oWDyZ
	JRP3jeFi3dD8PLx14c/O964cBeklZwTF7wpeDa1ZyqdWhyon5ckdZr1+OCnMHvB2u9T4jjEMc0y
	vmw1L9rO4AJPOauNe/PTjw+JMlKG+q6OLwe3BCwmXky72VYLmqu0iI3RcHYNS8NkD28LQ
X-Gm-Gg: AYBFou1F5VI4xy1X7vHKYeOLQi89sIP4IdOuLeY7vVOBWKnEBRjt8P0oEmfGLnenbgv
	Yclhivz+B8g5WqRovCwPPRs4ogaksead9eqtuBBE71urkNc+BrkI6R/evNhNQw0aEGFIaetl3At
	SdWX4CpBtAqHNq7vUGzyCimVp44XI2oPS2Pps4B1XetvXQcsmzeorHSDyHDkx/Qg6dgwCGBsTXh
	iMw/IYBo2QEv/8YXezd8c64CimL9ALJflEHflcaaJn6YxPjWfJMu7/OIbCKkxsI9TFkeEWtR87C
	eGiJCKLuFRavdcE3cWCREv6PWNdpuTA2KA8DqdqUWpBY+M5sfSpd1mGUFY8jMXE/Z6RKaAvmJnL
	GnfAvl/EEpqJj
X-Received: by 2002:a05:7022:3b85:b0:163:cc63:ecee with SMTP id a92af1059eb24-16a65c03d19mr29504827c88.45.1792082247055;
        Thu, 15 Oct 2026 09:37:27 -0700 (PDT)
X-Received: by 2002:a05:7022:3b85:b0:163:cc63:ecee with SMTP id a92af1059eb24-16a65c03d19mr29504789c88.45.1792082246332;
        Thu, 15 Oct 2026 09:37:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a5a2fb99sm116946c88.5.2026.10.15.09.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:37:25 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:07:17 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, hkallweit1@gmail.com,
        linux@armlinux.org.uk, Daniel Thompson <daniel@riscstar.com>,
        ansuelsmth@gmail.com, donggeunyoo.kernel@gmail.com,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: phy: qcom: qca808x: Add regulator
 management
Message-ID: <atEBPbpMtlmG+Mxe@oss.qualcomm.com>
References: <20261015143849.483339-1-elder@riscstar.com>
 <20261015143849.483339-3-elder@riscstar.com>
 <atDz2hJ6xpA3p5y7@lore-desk>
 <4fc165eb-b57d-41f8-b7b9-c9fe433d866c@riscstar.com>
 <1af4e7a8-adb9-41bd-8841-61180b284470@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1af4e7a8-adb9-41bd-8841-61180b284470@lunn.ch>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2NiBTYWx0ZWRfX35SiTDRTwnWm
 bkHthDePeQjgeJaLoStBHmWdD7N5iXHzOoOZHzyiRbDbYEoEbmnj7k5p8H13zOheiFbOZOBEA7+
 1rSJ0ctmE2flXDfnbsONx/rCfUaWArVi80IdAs4Ok5Fr6AdWRr/MQlXU1BT1MDuoDorzDuzsQiO
 zkdedzNma6h9fJBft1X8a7Zc0vrxKCq7o4ni/1kykvYE2XV9abMHhoXdvqVTgEGEu9q13MVf6hc
 cIRguxTmL5M8B8H/jk05zpinKghMGvOw8Oe1ntwJ4kmhqhx5HovkG3Cwv21IsrSglKKWh6su5YK
 hYoXquxQhGTa8vepg+uXt1vlBMbj/4Diw8tJ5P55v5xm6t70H/2wYXvEj1L7abx8i+9gerh93sd
 8s5hKfqsKN+5oqOzwpEzD5JzM9dI48+h01UsPImBo3XnWdGDBoZpDNQnXaZEeangKv0Y0BnU8Vc
 YvhWwiMbeHMagibDRrA==
X-Proofpoint-ORIG-GUID: VekrV8yzEw1Jf9-zqaHt889P24JUBfTp
X-Proofpoint-GUID: VekrV8yzEw1Jf9-zqaHt889P24JUBfTp
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad10148 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=XObs8swggq2u4OB2KFAA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2NiBTYWx0ZWRfX9oBJ+yuKmdjT
 xfdziG9fciNx77hhoRz09GTkm7Ll/v42GvIuEX42gedQOWnVdwW6OG8GPmboD9SaOSEB1Vn7F0D
 b4NYO3pdnri9VyQzhjoFNCJkNXRcQ/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150066

On Thu, Oct 15, 2026 at 06:27:01PM +0200, Andrew Lunn wrote:
> On Thu, Oct 15, 2026 at 11:01:43AM -0500, Alex Elder wrote:
> > On 10/15/26 10:40 AM, Lorenzo Bianconi wrote:
> > > > +	if (count)
> > > > +		fsleep(phydev->mdio.reset_assert_delay);
> > > nit: should we check reset_assert_delay field is actually set?
> > 
> > Are you saying there should be an alternative delay used
> > if it is not set?  Do you have a suggestion for what to
> > use in that case?
> 
> Does the binding require the value is set?
> 
> What happens it if is 0? I think fsleep() is happy to delay for 0 uS,
> but does the hardware still work? Does the datasheet say anything
> about power on delays?
> 

I was going to share a text version of the power-up diagram given in
this PHY's datasheet. This might help.

Power-Up Sequence

1. DVDD asserted
   |
   |<-------- 10 ms -------->|   (required for external power)
   |
2. DVDD18 / AVDD18 asserted

3. VDD1P25 asserted
   |
   |<-------- 0.2 ms ------->|   (required for LDO to settle)
   |
4. VDD_LDO asserted

5. AVDD asserted
   |
   |<--------- 2 ms -------->|   (required for XTL to oscillate)
   |
6. Crystal 50 MHz starts oscillating

7. PAD reset deasserted
   |
   |<------- 10 ms --------->|   (deglitch time)


So, maybe just fsleep(22200) or something a bit higher?

	Ayaan

