Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F78331EB4
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743765; cv=none; b=EZUMWTuK9JVZbhMcceqSanwIIfD5POSMjncqHOeJBatfJZ1HNEVFmrZm0PKnjI0hjD4gjxEPTJZz5z3RoWVtC5Ifo+oIUqlSzvoC7sC5AgnHl9T1g5tnum/pVoYeUiGU36PtzEtLeFWUykqXsvEekNPoJBop5eW4mmia0BegaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743765; c=relaxed/simple;
	bh=EkHkhtZcjH1ZWXi05MLIF8vYqX/yxr5AlwxocmiI1Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbA6xSaTuWtj1pjy6HbohGQAsSRsVFZO514P0hFP0MWYVi6Z2K31Eqk738k6s5/2lNVr7ra1TZf61G1pVplhsTEAl/PJtoDF388SGKqbp7p4lfJdZZNqyAI5mhb1Jv3jC9VAyXdR+T47Smlwz0DHESmCD8qvaWhYccbwU6BPg0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfTKmqQA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYw0t3tj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfTKmqQA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYw0t3tj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bgj13957457
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 07:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GYEKEsLD5+RSuHyzzYJcx+SU
	LIwPICEpqweNWaypYq0=; b=SfTKmqQAw2VZPoKIjgc4+k8kTWH+n5Se0dFSVYCL
	sRQ+SDxD9HVwtRRdVoMNVNazd1rtRUzA5CMy1gTs9LBu2oYHo7Re4NprrKtNAYKt
	fBW9en0m7c0wJxuAQOqHHwM1Gsb7SBUByq35TCxf91FRn5ug3xR1NdOSUYKxd5Q7
	CTdRlo04/zp+7SSAMPVl5JQ3cpw4g/wyFqLHK6rlBHXkxfCV4A8tjWhdjPcgJ2wN
	iTXuPsxprnwN+Tsmmn5h4hVa4/L/XgtNZFuOS6ugd8Bk+a8aP+KfickyrPnBlE+Y
	Dvre9LUYWZKQ1qgMpEPregvmXAtX/myah0AIPfVvfRWS4Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvngac3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 07:56:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so248935285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785743761; x=1786348561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GYEKEsLD5+RSuHyzzYJcx+SULIwPICEpqweNWaypYq0=;
        b=TYw0t3tjr1wf0sVMFW0aCY5bf7G0YcwWjANW71fYU5NUv2WQwsiLmm6JpuNTuvR6cB
         A9bUx1Vmf7rqyRRZzG47tstuBy5a3sZmv7e3L4zf3utK2uvJxC5P4t/fO7YncbQJVIK4
         2qdoACahMD3YYAYLHtuC4x5xg8JEwVV8v6IYzuZSzugCkg+mnKNU0VMfzPBqFiqtvNXR
         xqSfugs5xGasn1SfP7jMZApD7A6zPAR7hnEK+pkSC1wTGdV9zPVk/P2eRAVkzHixpE8r
         iREDB5xjEXvBxKjQNS4RbwoLIoBjDpyiEDB+2W0+rBh8qnwcxVyO4w+bBMUc50jQNs3P
         sUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743761; x=1786348561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYEKEsLD5+RSuHyzzYJcx+SULIwPICEpqweNWaypYq0=;
        b=g/Nu7ZG0tMRMSllk9OJepLtvqQhbDL8b57W7AR1cbsPAK+7/2W/4ad0oo7sNmjGAWs
         UJlq68S7OvfY5eAHsqYQd2NDj3CuYbHSNeriZGKK0gsNlUkzHrWSPfoqb3oyn4D7+ih7
         H6XFwvdO4O8d9HA15et7aWectQ0swr2AOxk6BZ50XKSzVYCF3rgL0HguAnxfaguq6xbP
         ZnpVz0/jMoCzCPpoHjLPsUjvsaCFuWCc8g+q+hvSOzUeXvhNi+MTFjZK/lQBgDiyzZd4
         +LHOI89frAsPAQpOnoTeuYeIh9Wle+LpkMZK+RFpcWDmFXaWI3Gssj8SHb8iwU/E1qJK
         OTTg==
X-Forwarded-Encrypted: i=1; AHgh+Rou48gGzayw67zsWlSiOauZCz284iYpGeiQNNPYl/KOck0z1joLuQEYJ+28iSeGwqJBix5C/95QfiddEr9Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1YWdILAB0F9pQoTvu573/yXTBD/QmPV7V/bvzinSxH+2B+be+
	atZAQMmmCwn6WEb/2n/Mg/pPZf08Va+ctYNUmlB2qpJ/4Wobb14MZSbz+yYpPQ1xulwar7QGOZP
	P/Ra4sgwdTQdlc+yUXnzznRAo3OJnG2wkgWirghtO5f7B5G+M+US/A2kG4yEaxR+jYKof
X-Gm-Gg: AR+sD104OopmRtdDb/5ZOwh5l6+hRnCaiU5U0eOzsvG1DUVHJX2myJ3GsZP1yBcVRN8
	Yts8lD+mL/LqtSvYn70GkCkhAGc0mQOySRTf8mH/Gf2OiVh91KUHhSq8RLZKwHIVa0RWMj5bGKf
	jUI5tMls9lkUEu/lSs6W9oyF5JAvj3sotjL4LxLzzITzHcH3pglwbeuWI3WJb3Guq4TiFzNaCv5
	yhNmqQW6R+ExRKqcVXJD6gCQh+Atbbc1BJKF8bZNB77AjoRlyUqp7cT6lV8VijAP1ljAbecoR2n
	iPpa8aB50BWo6NMoB19XjtU+JQQzqie6sPBNECi0zlXpK88b3xRD4fflKyJPQGEdpwuNrChQCHX
	tXKYVM0tUuD0d9JX7CXEWaRzgcG+MIxoegWWJMzouJN2D18Y8NKeb5lR3rmuOUOA=
X-Received: by 2002:a05:620a:1b9c:b0:92b:1233:99e with SMTP id af79cd13be357-934a0a77725mr1890556185a.35.1785743761290;
        Mon, 03 Aug 2026 00:56:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9c:b0:92b:1233:99e with SMTP id af79cd13be357-934a0a77725mr1890552885a.35.1785743760823;
        Mon, 03 Aug 2026 00:56:00 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349bc25db2sm618024485a.2.2026.08.03.00.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:56:00 -0700 (PDT)
Date: Mon, 3 Aug 2026 15:55:53 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
Message-ID: <anBJic0f2SPRi6RR@YUANJIEY2.ap.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-2-yuanjie.yang@oss.qualcomm.com>
 <20260730-alchemical-phoenix-of-excitement-fff9bc@quoll>
 <amsfSzgMArno9zRH@YUANJIEY2.ap.qualcomm.com>
 <2eb33f53-2320-40dc-8098-79fc4f48af8e@kernel.org>
 <28fb7750-bd46-4f3f-a3ba-7cc1fb88b235@kernel.org>
 <anAx4kqb4PwEImeE@YUANJIEY2.ap.qualcomm.com>
 <fe9d0f2b-3a86-4950-ae4e-fa5182706a38@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe9d0f2b-3a86-4950-ae4e-fa5182706a38@kernel.org>
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a704992 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=TJUqZQk6AAAA:8 a=EUspDBNiAAAA:8 a=m8ToADvmAAAA:8 a=CfPy2gZGbKdSMgFAa3AA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Q0W1slMkcave-rSCEGgY:22
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: LPgL3mAd3fyYkTr9gzu7NmX0S6YlR5jB
X-Proofpoint-ORIG-GUID: LPgL3mAd3fyYkTr9gzu7NmX0S6YlR5jB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA2OCBTYWx0ZWRfX3k9VQbGfcrfZ
 hUdCZb5kTtGiFF/yz7cH7afHioEMaeueYqSm6Y/h1Jh2WzZQXmZ0YfKtR+1foAkSEOvBd7QVMKh
 fCHZkQohxUQEzt9tBptW4nFDdCOP4fbnPoDlNK2VMZjmRKHmhQxZYmmmltissRJ4xSsL/OE3Mk1
 OstKFDe0wYB7pKgn+PetwqBbF0mxoxWkGR3XozWp5/IDv6q56y2ENuvv4ClqHrNGMThHAFPtOGx
 ImnbdpbksCi/jEIvPSixaJLsnIUXLmAh1oL7g8MCFiO74f+ISTPhFtjvD2IA7514TUycAUaA6t/
 dBwAG1khSSQrcF0NIYIiDqenbtpiZqVHpfTYP7c4FCNRQvTLxJToclRocW1xGE9FiW0rdmkNkJv
 EoUEem1scgSXdIHB8Xwm7Ow1XR0pSYYubPn+REgtLPPKjH6EttYU/yGFtBcXk2AQl9ySpfrIYMW
 3/rKEBH+4f9zKSkSo5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA2OCBTYWx0ZWRfX6zGGBd2vuGxo
 9Qg9Ex9rYkqAqhNIkoX7LF9+q5L79jsq10/MNNQeBISZ4G5flc7bfpWDrBjeSvSia/NZ1yXo/6X
 9hvxaA7VqrlWCgp+O+8/JnqKmtM2FtQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030068

On Mon, Aug 03, 2026 at 08:36:11AM +0200, Krzysztof Kozlowski wrote:
> On 03/08/2026 08:14, yuanjiey wrote:
> > On Thu, Jul 30, 2026 at 12:23:56PM +0200, Krzysztof Kozlowski wrote:
> >> On 30/07/2026 12:08, Krzysztof Kozlowski wrote:
> >>> On 30/07/2026 11:54, yuanjiey wrote:
> >>>> On Thu, Jul 30, 2026 at 08:51:40AM +0200, Krzysztof Kozlowski wrote:
> >>>>> On Mon, Jul 27, 2026 at 03:07:16PM +0800, Yuanjie Yang wrote:
> >>>>>> Document the device tree binding for the HAMOA-IOT-COME board based on
> >>>>>> the Qualcomm X1E80100 SoC.
> >>>>>>
> >>>>>> The platform consists of a system-on-module (SoM) mounted on a carrier
> >>>>>> board. The SoM integrates the core system functionality, including a
> >>>>>> SiP containing the X1E80100 SoC and its supporting components.
> >>>>>>
> >>>>>> The COME SiP hardware is effectively the same as the SoM used on the
> >>>>>
> >>>>> Effectively the same or the same? I googled for "hamoa iot come" and it
> >>>>> gives me zero results. Provide some URLs describing both.
> >>>> The same.
> >>>>
> >>>>
> >>>> Here is pdf about the "hamoa iot come" SiP and SoM
> >>>> link: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
> >>>>
> >>>> The preliminary figure provides a complete overview of architecture, including the SiP, SoM.
> >>>>
> >>>> In Block Diagram
> >>>> hamoa come Qualcomm X-Elite SiP Module is the SoM on haoma evk.
> >>>
> >>> I see on that PDF "SOM-6820", not "Hamoa IoT Come".
> >>>
> >>> I have an impression that all this and previous bindings and DTs did not
> >>> match reality at all. Or did not match how upstream works with such
> >>> hardware.
> >>>
> >>
> >> Adding more: I did ask in the past to properly represent SoM and
> >> carriers. I pointed to other examples how this is done correctly. I did
> >> look now inside and found absolutely no reference of actual product
> >> called "Hamoa IoT" or "Purwa IoT". For sure there is no "Hamoa IoT Come"
> >> SoM (sometimes COMe appears).
> > 
> > I check the hamoa iot evk board page:
> > https://docs.qualcomm.com/doc/80-77183-262/topic/Getting-started.html#get-familiar
> > and 
> 
> It says it has "IQ-X7xxx module".
> 
> > purwa iot evk board page:
> > https://docs.qualcomm.com/doc/80-80022-297/80-80022-297_REV_AC_Qualcomm_IQ-X_Series_Evaluation_Kit_-_Linux_Bringup_guide.pdf
> 
> And this is "IQ-X5xxx"
> 
> So how is this anyhow related to Hamoa IoT or Hamoa Iot Come?

Our current naming does not clearly reflect the specific hardware document it refers to.

Maybe "IQ-X7181 evk module" and "IQ-X5121 evk module" can would better reflect the actual
hardware configuration.  
just like:
hamoa-iot-som.dtsi --> iq-x7181-evk-som.dtsi
purwa-iot-som.dtsi --> iq-x5121-evk-som.dtsi

IQ-X7181 evk board: 
do some dts name fix, just like:

hamoa-iq-x7181-evk.dts
  iq-x7181-evk-som.dtsi
    hamoa.dtsi        

> 
> > 
> > And I see below info:
> > 
> > Dragonwing IQ-X7xxx EVK components:
> > The kit includes the following components:
> > Dragonwing IQ-X7xxx EVK mainboard
> > "System in package (SiP) "
> > 
> > I think the current naming of hamoa-iot-som.dtsi and purwa-iot-som.dtsi in the
> > Linux device tree is incorrect. They should be renamed to hamoa-iot-sip.dtsi
> > and purwa-iot-sip.dtsi.
> 
> som/sip does not matter here. That's not what we discuss.
> 
> 
> > 
> > hamoa-iot-som.dtsi --> hamoa-iot-sip.dtsi
> > purwa-iot-som.dtsi --> purwa-iot-sip.dtsi
> > 
> >> Look, this is a SoM:
> >> https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> >>
> >> And you can find corresponding bindings and DTS in tree.
> >>
> >> I refuse to accept more of this fake products trying to imitate well
> >> known industry standards in their own way and effectively pushing some
> >> downstream crap, just because that's how we do it in downstream.
> >>
> >> Unless you can present us with such product details matching what you
> >> send, I will be NAK-ing these and future patches like that.
> > 
> > Thanks for your tips:
> > 
> > I check hamoa come som page:
> > https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
> > and come board page:
> > https://www.advantech.com.cn/zh-cn/products/1-fc23ff/som-db5830/mod_16b1a718-27d6-4a4c-8684-e8f2a8e9c57b
> > 
> > So I should rename come binding with real devices name:
> > binding should be:
> > 
> >       - items:
> >           - enum:
> >               - hamoa-som6820-db5830.dts
> >           - const: hamoa-som6820.dtsi
> 
> No clue what is this. But the links above are Advantech.

correct here: 

      - items:
          - enum:
              - advantech,som-db5830            
          - const: advantech,som-6820
          - const: qcom,iq-x7181-evk-som
          - const: qcom,x1e80100


Thanks,
Yuanjie


> 
> 
> Best regards,
> Krzysztof
