Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E082A3BBFD3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 19:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785354105; cv=none; b=YSYzx0lYoLXQWkaJiX7yVnDU82Q8WRbQ5FR7ryQq7gIo/uWcumeTjDt7+I9TemZYIrdDHGDg2dYLS/mD6jtioxgqDYFCaid5UBXWDDrwS5/q9TVtIkFaWxmcu0GiecHBN/42IQWVzKj7o+SaB99XoPHhfq7Hsd8LyykKHElT3n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785354105; c=relaxed/simple;
	bh=iF30+f7Z/wbyKq5acuDFudXPzOcBVvBAz1k1KhMTdUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qp0SljxLiUU3gp/pM+XPhFA6+Tsz/amhFos92O1xMLQMMN29k6f1o5idjq8M2bTZbMc3F6nNLxv2JJPfFhQWMecpwDKqq14zr6Q/iJALdWkh/7lfHJgayFdvT+oKK/qpur8xFFAzREGxZQCS3gS1UQapVdpiWY6/56gnXFezLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c68/MIAf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORrcF9eh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c68/MIAf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORrcF9eh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TIoH1R2485068
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 19:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ekVAer2PdbnQUyqoSa9drOvY
	dSAfeYuTWJbyCXDkQZk=; b=c68/MIAfX0ndSl48O61QvFqG8FZGUay4WNU2ACnZ
	1IaWnPmdCksHmARub4558n2NDpE8N6JUzTUpPMAYPmlxEq2pN+h33YR+1o1WzP0B
	JWVrH2aYB+D1S5fnjW7se+PMsPYVbkFOLt6RZQ1JDQhPM2Y3CTIqY2lD08acayCW
	TQ3wZO/hWtCIvPsl+2Bkv0wgMna/tuIVKkSlALULTfHPAQyLAD1vnevHxHBTPhx6
	30qeCQp1tBnZWygwnwoVm2OcjVTbjWidHaQ5sQ0h0VRN6p9aI+VsGxexRc5VzEUK
	y3A16ajlMfDGnw6nrbqLhN2GNpl6OmeE2CdhCfOix4idjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqq54r80v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 19:41:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811279d51aso2251469a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785354102; x=1785958902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ekVAer2PdbnQUyqoSa9drOvYdSAfeYuTWJbyCXDkQZk=;
        b=ORrcF9ehT4XM7HZdcxMGwprGNPiGtWKrXJ8R3rNFa9Xna+XLCpZv+av1sAFk6HNx4e
         vsBsmmpc+cKVaDn3AB09fplr7jAir4DovFknd4xDLUVSFUv8CZICwjCuIpKyuRXdS/R3
         rnrp9C66IbFbTyrueJLZ2pyTDAswevAF9uOG+9sINoPeiQFHjLBmyutF1/uRYxsfoCvN
         Cf5gIwBhn0afzvNSSEMgEKjLBb6TlSECK0kJ1IRViHzaldLBsx/YycvuA7Dd/W3fAk07
         05d7abggzqi2GbowbAX1Fc9mwUS7QgEHP0J8SuCkTrq/c0JvnFGRWWQXSZlYhfWYd4xs
         8/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785354102; x=1785958902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekVAer2PdbnQUyqoSa9drOvYdSAfeYuTWJbyCXDkQZk=;
        b=P4+iGZqT3pgkymYxV4JK+Y208Nhl6Pwbg1IZNbOj7vgMCFbt5feeFYFdiVOIsctnTu
         X8Tlvk0JXWtw4HhH+XvHLWyCqlhvyx9kZerA0XYHzuyM9G4+trieMVro/dXS/aY5RyKq
         wMC2H+1DJOkuuBU5CfPu2ZMcm+U6B7Udzjtc9NG4+KcJqpvmzZqL0cneTGXKNzR95CW4
         kraBjDHx2hEyE9i/c4B1OREhI6xmlR78O39iv6gkGnpwd51sE9vCGWCMPXL92RLNJDJc
         wZf9v1SKMDYruo6hWxrX2WdTOU1/5P30ATEX/ITGK6yvPFOMF4iXccVIdvIQgYLOfC8g
         C0rw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8aouRIq9PfnMDe84JSikGp8ii75DDbA1QlM/fq4ZV8Hq5cDyLda/ZQn1WECDXeFTe1CjKey3iLwPlxLEK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3LUH/6sbafaTVcjihvbhm/IbEaWSKwcfglGdUNuPcEK8qbupS
	M7dUcEu2qyh8RW/ymdrXZzwXKaqvopEwoemu6jTQR1sRee9LzO9r/vSEGMiALqh8xUzjtsokvLF
	QK4d4i86GeAqFc+eDyjK2J5IUmWK/ti0EiNDsDLv+PmhCfSaAXsj3yE4yVjNCIPpm/WM6
X-Gm-Gg: AR+sD12v+C1AIfaS6AlOBcQF4TJFYNHoY64iz/VrbNaKhCijapWo4mU4mZ5PZJU8YOy
	It33dUbKDzsngQtVKIWn/RM8YVVAE7aMeUxzIFgUiPGzW4y3jwgxbYcAIzX37/5K47yzJYvGbmP
	6z0ryqREiKgsrVQ15rNUxnAQdcj94v0jnUDGUTpdArCWoUe7LPS3+3ZYth5KUvaMJXdiIiqw5bV
	cQGt4KHy5OE1BD1Z5YduJL20MKX2w1/y/AhBg1i7wbcNLgpnzOnBFl2ylqvPJ3i6nw0yEb64/so
	WBI8diA4ubNRJeqAwh4HTjG6PUbCX4ERJxu0MdZ2MbA9m0Jpb13/eSK8IRTGIbgcNIOXE7vopgo
	ZzX09V29IbyLsrHSbgm/e3wuDHhsowQ==
X-Received: by 2002:a17:90b:1802:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-38f99011abbmr218021a91.12.1785354102454;
        Wed, 29 Jul 2026 12:41:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1802:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-38f99011abbmr217993a91.12.1785354102051;
        Wed, 29 Jul 2026 12:41:42 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7262b8bbsm10412645c88.3.2026.07.29.12.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 12:41:41 -0700 (PDT)
Date: Thu, 30 Jul 2026 01:11:36 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <e25dsbpp3chldtoh2awrtxfxkju3jevphn5pcoqvfehibwg2nr@yj5pfelpti63>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
 <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
 <da299944-0093-4d1a-b092-f7857b101199@sirena.org.uk>
 <gaigrfpfunsqwuxf24uonw4mrkdse4ap3cywi2eg2qdyfgfzsd@hk6zghfqnkty>
 <amNfHiL2W-uLlPjY@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amNfHiL2W-uLlPjY@sirena.co.uk>
X-Authority-Analysis: v=2.4 cv=S6/pBosP c=1 sm=1 tr=0 ts=6a6a5777 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=uAgIjIorKR3yHtSeqEEA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: gtYSWBHaIIEKWVCt5AnuQSN1YG_bdqz0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MSBTYWx0ZWRfXzLxfnSxs6XPA
 R7qoxXXlMZ7RrDIWMpzAUFYESAqY0eBKN6zsVRVsPD3xnoxMQFFPVIVflmvIxAjGGZLm88UlwL2
 00SBZI9oukz0z4KX++8inzJsU2NQId0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MSBTYWx0ZWRfX99+JUWs6CZmI
 ZXLwFKfEjfptHa4DUR2DBVFKtUlIPrT6thBIKANRKewmZgjO2zzEUQvPOQ4+2PPVmuyPOHKtNrA
 YV4/OZBkE1sf22dxKEDwDnR1AMthd+lSjEqCjlg+Ak4WRM11sdOpCZMkfv5acUPX4BZYFm6whYH
 nJcjNe8c7eBsFvgEOvZsyA900ZZfPprCMuL9Y5HXt/SMWDRo3HpwJaXBL3LO9S+oAb62MzX8kmd
 08VcLGoa9Ap1v7EDYy05rpE0wKdUN0dfcPJFeW/UtEPFj/gkf9RuozS/ht4MbZCGMSzvhEBWscv
 ljHpSSRS1/amBbpITtv3JaIaJbdc04lBOPSFfL7NFaniAfKsb8nHkQK+5m+R2fcdtoZhbmJz8+x
 BPIA5eU8ZD08JQWCdV7pNdLJTYQe0JQhjK+M1C1OeDA4323U5Tf9so42mcml53lXzLjJYd3x8rG
 uOdBb3bgrbm2sGDiNbQ==
X-Proofpoint-GUID: gtYSWBHaIIEKWVCt5AnuQSN1YG_bdqz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290151

On Fri, Jul 24, 2026 at 01:48:30PM +0100, Mark Brown wrote:
> On Fri, Jul 24, 2026 at 04:13:02PM +0530, Kamal Wadhwa wrote:
> > On Wed, Jul 22, 2026 at 05:46:37PM +0100, Mark Brown wrote:
> 
> > > A get_status() operation should be reading the actual hardware status
> > > right now, not driver state - this should be reading whatever the value
> > > is right now.  If the hardware doesn't support this then just don't
> > > provide the operation.
> 
> > Actually we are reading from HW what we voted in terms of ENABLE/BYPASS/MODE
> > and we are combing these in the `rpmh_regulator_determine_initial_status()`
> > to come up with the `vreg->status`at the time of probe.
> 
> No, that's not the point.  A get_status() operation needs to return the
> actual hardware status *now*, not a cached value from some random time
> in the past and not something that was written by the driver.

I can drop it. But I seek your guidance on how should i implement logic
to HOLD the enable/voltage/mode for the regulators which are turned ON by
bootloader.

we need this for shared regulators, to avoid a race between clients
probes to badly impact a client which needed the rail to hold its
mode/voltage/enable state before its probe is called.

I was planning to use get_status() (in a subsequent patch series) to check if
the rail was left ON by bootloader at the regulator registration stage, and
use that criteria to decide if we need to hold the voltage/mode/enable state
or not.

Besides this, since the sync_state() cannot be used.. i was thinking if holding
the voltage/mode/enable till regulator_late_cleanup(). is that ok?

Would really appriciate your help, if you can guide me in some direction..
Thanks in advance!

> 
> > So, shall I read the HW MODE/BYPSS/ENABLE value in every get_status() call?
> 
> If they reflect values that might be dynamically updated by the
> hardware, yes.  If they are just control registers that the hardware
> will not update autonomously they are not suitable for a get_status()
> operation.

It not will autonomously update, but it may be updated by the APPS bootloader.
I guess, that still would make it unsuitable to be used in get_status() ?

Regards,
Kamal
