Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F38C348898
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552756; cv=none; b=RCb5E/0dwpsRmwXJtEaD+uoIZDlrF6cNLkNiloK0MADlq9poRL+wnvh0wh5fgRRW+ySpE6LNlrRCG01R2QhRsRSACfar5Ds+xLS1bv1jOmFq67tz0WdnYLk0+428JBv9EjMqXgdcSlck7ehYFwIPsfKZR/eK7HFxlswqyawhS7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552756; c=relaxed/simple;
	bh=v0fWKcmmZaTBzmXsWIZR7+NS5yoy15MBy64/dQy39MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fN58JARccHQv16znnZ9Fpw7TZhcVhkj7+hPWYzSJwxJBFjLV5i3GL0LfGan8jWuU/mgjunQMFbYC54ROibh7Qh69CTosrI0gFAjEWlqYF5l+YsFco9gWCihFCraiCXLGAM5JYtXIAH4/MuPTaIRKJJ9mgWXWTjTuF63MxI5YXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0LlzcKn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfrbdEZN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0LlzcKn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfrbdEZN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvTcm2277507
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9lRDDD1vzpw5E/8CxKTqsEOwuxf/6n9OdNFo1Cm5mc=; b=B0LlzcKnPAUKR+UW
	CfZO7kvccs9AOuQ0FuM4SZV9mejvKjCVupbx5NbXyrZNbrOXg5hWHnq63OAiJ9lG
	dU9ePK3MwcRD7uEzXYWhWbyc6gDP4qFmhXb4qIGhDJUvnqSDXQI6fW7Olb2wrBBO
	KExlDAfvnroX3kJ5rxANUnjiq217XUIweru7UHpX0xlTNY+D1B7170jVzm/GWTVv
	0lufsBV41RO2EwK9eRCPNljwEy+teG1ZdG4a31O357IPK9ZCn77FgwwAR2R2Xl5/
	vFPQww+oPkb3frID67ABzH25a8M8vebcZ0WrXcUgsAnlGR0q/HakdVCatkYbNY0r
	OTcmSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c1jmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:05:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e8004d60eso1518465885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784552753; x=1785157553; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9lRDDD1vzpw5E/8CxKTqsEOwuxf/6n9OdNFo1Cm5mc=;
        b=HfrbdEZNktMpzRbsGPA3aglJu2U42YhwsEM5ux13YNtXj3e4j9xSUWvBvUxBZUaoYu
         5wHYJ3SUnJFjlVUU9k9M83tNV6yb0fTOYORO7tqRNuaEvv/JrZHFbpjwEC2zxp8pvrkF
         dHvUcQHJ5KJ6N/y1JEbzRcVFqknXxmc3jMf2ukE0YZ9FPAJCLyoJ/+qhM07WEUtqIGBa
         xTn+L9dKshMrXUtx13ceXumb493rpLeMSl9mc1MG12CpakQnQlzzoy7gQ96xpkn8pLmZ
         lFD+ANmwPBr/JBnpYPIXD3viIlfbHk4RlVEsHhawB4xDWJhM9UGLjeV1CyfhxRUPfUZP
         uuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552753; x=1785157553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B9lRDDD1vzpw5E/8CxKTqsEOwuxf/6n9OdNFo1Cm5mc=;
        b=C5fZi/UWo07hMVW/k+ZJvHf2eBB9Q+GYnMLxmR6sTYVZemIzL6XdiTfejxry6REbKF
         XWxPdXiBlyilVq932JECRWQrhj/VaCui0lIdd+zbk+8yPSNfSHVtkF0B4Eq1dhJXWg0Y
         3YreZLVPT+n9xoruwZMiPQmtLHtOjiHc8AbzkOljN46c2joz8Lqj9yVeo0IQ8ypryvvt
         WT8SImjmbC3m0h6gEvKtg5x2MItDdXChOaoWG5Vu2qPxWV8ebRwV6K/dZ0z+iKCkDcRf
         R0ExV/nzTRJ4BfONB29Y5MKhVLxLkBaZI7nJ9Dlarf5adzxsdnlYD0PfLmci2WEvPvhA
         j/Kw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/0qQxNko205I0nPzoYSp2BAJP5lD4NTeIpZm7aq8x/sc9HqPmya5KAuQhlmuN3QpDaAG0UYNkVgUOtkwq@vger.kernel.org
X-Gm-Message-State: AOJu0YzAivg99lrPoLDoyOCUVWFgj2oD4oHbfYhnbsUsU4IJAH6kQ4nu
	D7BI6WXN7AZVq8eZ/176NUis837opVqesW4Stw8rvBr2XkWAgSg62kzD9KPjRQ18AiMHGYLTP6D
	7cpp6LyC2P8dDfByHoHh4EfM0WZMXy1XjCVT3OAjrkvzhZadC0rEgC70Lv0DVpy5Sgl67
X-Gm-Gg: AfdE7ckAp+gj8MD1OsEBwj3rnUTXCT+nJVu74JztmYDP05nkSWibJVrHOGrswp6h+YF
	pG7+vmWoL9S/5yM2zGvIfcOhISEu65Er/D9B77VEnnpFJYjMeRIYRXyI0eotE72rfVlo7zDZtY4
	Q8bFr8wiGUoqqAG5cBcm2EZedDBC38sxRnVtol9STvL1v/8+SVltOG+mPFh+0WUx1IpnEHesxve
	VLkkqZCcaqtWfFW5kk3veMYlZ3FkpzkEOvmQtTIklSoYW3pC0kXLCZzdtwr6pD4mum9EINgBjCN
	PXNq0P1B9s04vO7buHPMdyMK/fHFSfvDTRooJLUXZ63dXFSkeFpfD/nYX+GdcuO1WjxMt1FFWXP
	HLe5SpleDTsB0x3Nli4pBBIyVujOgB4l8atajlrFlfZdyJq5eQYtIZern98aUKFBYNQz5vxnTr8
	1DbOUJYBsxe+aFjA==
X-Received: by 2002:a05:622a:1114:b0:517:577a:76f2 with SMTP id d75a77b69052e-5213f667ef7mr126686561cf.54.1784552753110;
        Mon, 20 Jul 2026 06:05:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1114:b0:517:577a:76f2 with SMTP id d75a77b69052e-5213f667ef7mr126685821cf.54.1784552752353;
        Mon, 20 Jul 2026 06:05:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d8a71esm2239425e87.1.2026.07.20.06.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:05:50 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:05:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <rq4echpblosddelpjmcms4ezynohrzfbr6axfjtonhd7ptn5mj@gj6ecmqv4ows>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
 <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
 <fa5bf9e0-66ec-4506-a2fa-bf1d95adf9a6@oss.qualcomm.com>
 <6c89ef9d-3551-4b92-904c-316dbcffcfbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c89ef9d-3551-4b92-904c-316dbcffcfbd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5e1d31 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Xr-WBXzQFotaGLdkbuEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _M9SwioeOmB5orAM9JlsjpPALNP_LYAh
X-Proofpoint-ORIG-GUID: _M9SwioeOmB5orAM9JlsjpPALNP_LYAh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfXwo+bRcQaWhDj
 L9Jh3PMJp2deGgcUq+57ZimRC0sJTOlGX/42N8E67yU1eG3L8m9zM8Gexvrug5MU/vjlzAJYeRZ
 gN/q7E/mJRskpExACFRIrB5FSl94SOQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfXysVVHQPP3C2F
 5gmwdXNUIVacypANQfrHOqBl/OGq0pvDrI21bRXjFWBsx3T0vjee1bLl9hlHXfOxH/uLfNaFEis
 wyj8/UD7A3/xueaRD7NcPoYFOPflg3vBnfCAvwkzI8yMKNrxSQXY6Ch3IHebx1vvGglocUdWgSy
 K3XRBDPqZSigS0FVqAGrgoClKfQzaxYtCiZvTi38tG1FzEWDtutbvaEWI/JSN7mt8+H/HxlomVA
 MCKdSwN2KmVXoxscXFFOO3gtVEjB7El/0RyT2ofNIweHBvGopBJ5zXDhuD0+R3h7Ab3pEe/eIZm
 78f6qbcPqYH+jbNkfTQY3HwETofuaJge+kPF85mvVZMWVaTFrfHi9stUCJ8jL05G0ZMwxhIkxyr
 KZexVBzG6nDiDBQPLvdpWsuQSaoehPs4Ychkdn+Vd1tIgw9Wv/A6WRxciksCagbBb9AVrrIYlfp
 iXYaoeloCKMaKSRCI6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200144

On Mon, Jul 20, 2026 at 05:37:25PM +0530, Arpit Saini wrote:
> Hi Konrad,
> 
> On 7/16/2026 11:21 PM, Konrad Dybcio wrote:
> > On 7/14/26 9:21 AM, Arpit Saini wrote:
> >> Hi Dmitry,Konrad
> >>
> >> On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
> >>>> Hi Konrad,
> >>>>
> >>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
> > 
> > [...]
> > 
> >>>> Normally the backlight EN pin is controlled by a backlight driver.
> >>>>
> >>>> However, this panel uses MIPI DCS based backlight control with no
> >>>>
> >>>> separate backlight driver. Since there is no driver to assert gpio91,
> >>>>
> >>>> we control it via the panel's pinctrl default state..
> >>>>
> >>>> So this is platform specific pin , we need this to enable/disable
> >>>>
> >>>> the backlight.
> >>>
> >>> Handle it from the panel driver. Also please fix your editor to prevent
> >>> it from inserting extra empty lines.
> >>>
> >>
> >> Earlier I handled it through panel driver, but this GPIO is specific to our
> >> Qualcomm Daughter Card, it is not going to the panel connector.
> > 
> > So is it an enable pin of a voltage regulator maybe? I'm having trouble
> > understanding how this is all tied together, given the panel driver
> > uses DCS commands to control the backlight status
> > 
> > Konrad
> 
> No, it is not a voltage regulator enable.
> GPIO91 (WLED_P1_EN) is the enable pin of the WLED driver IC on the Qualcomm daughter card.
> The WLED driver is a boost LED driver that powers the backlight LEDs.
> The backlight control works in two parts:

_that powers the backlight LEDs_.

So it is a power supply.

> 
> 1. GPIO91 must be asserted to enable the WLED driver IC itself.
> 2. The panel's CABC output (a PWM signal) is connected to the WLED driver's PWM input
> and controls the actual brightness.
> This CABC output is driven by the DCS set_display_brightness command sent from the panel driver.
> 
> So the DCS commands control brightness via the panel's PWM/CABC output,
> but the WLED driver IC needs to be enabled first via GPIO91.
> 
> Since GPIO91 is on the Qualcomm daughter card and not on the panel connector.
> 
> Dmitry suggested , it is not appropriate to model it in the panel binding.
> The current approach of asserting it via pinctrl default state in the board DTS keeps it board-specific.
> 
> If you have a better suggestion for modelling this, I'm happy to follow your guidance.
> 
> SoC (ITP Baseband Card)
>  ├── GPIO91 (WLED_P1_EN) ─────────────────────────────────────┐
>  │                                                            │
>  └── DSI ──────────────────────────────────────────────────┐  │
>                                                            │  │
> ┌──────────────────────────────────────────────────────────┼──┼──────────────────────────────────┐
> │ Qualcomm Display Daughter Card                           │  │                                  │
> │                                                          │  │                                  │
> │  ┌─────────────────────────────────┐                     │  │   ┌──────────────────────┐       │
> │  │  DLC DLC0697 Panel (ILI7807S)   │◄────────────────────┘  │   │  WLED Driver IC      │       │
> │  │                                 │                        |   │                      │       │
> │  │  DCS set_display_brightness()   │                        └──►│  EN                  │       │
> │  │        │                        │                            │                      │       │
> │  │        ▼                        │                            │                      │       │
> │  │  CABC output ───────────────────┼───────────────────────────►│  PWM                 │       │
> │  │                                 │                            │                      │       │
> │  │                                 │                            │  LED outputs ────────┼──► Backlight LEDs
> │  └─────────────────────────────────┘                            └──────────────────────┘       │
> │                                                                                                │
> └────────────────────────────────────────────────────────────────────────────────────────────────┘

This is a nice diagram, but it shows backlight LEDs as something
completely separate. Usually they are a part of the panel. Are they not
in this case?

I'd be more interested in a different representation of the information.
What are the _actual_ panel inputs? Decribe those (and only those) in
the panel bindings.

-- 
With best wishes
Dmitry
