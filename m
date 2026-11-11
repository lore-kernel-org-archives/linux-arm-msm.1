Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406391;
	b=ibQ5SN2xBkGnkANcFGtd0WaSq2NID4z3ve+hUGj2p9Xo3uao6SxdceK+SuFNZLO5FqZW
	 eRFUO0ACKDU9WbhFzoknNl3NizydPy6LhaPp3cRpcwzw7PD9GOtC66kbnhQ2b+lrfVLk3
	 WH/XMv447Pt/vAb7nI9Jq7mSQn8sqKP5SEIpiHlfEAWU+G6FCLq173JaEOzSYPphhFU1p
	 dDCr/5d4BqXAFjL2iVZuYQp1CKqczkAzZsmYpJNbPCLOAMK2qnUEicOJXt6kmEmWwn2X4
	 Wj//1i+iXXnIqXiJ7DHmuc266c94TwdL9MMlY9KHiri8yoOcF0SCh3unFdg0pz+A3Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
	b=vRxJVF1RYkrQz/NENKoQNi53GYBIWGI/tjqid8tGY4sCWlRyo/Ww3Vyd3vJG4pHkAWDr
	 HQ0PnypzHvKNYitOXRVfNJ+xF8v+Zaogr5J/w7oRYd23V4JoLWCZCFeIagbywnuRFRZQB
	 RCfcHSb9pp0852dPnxLLlsHgEkcQIbfLJFxEFuk/soPjFaEAFTBHeIoP5VHYxZm/9CxZJ
	 OwzfADl2FMNtgQeZZmq/rXskH5BxuCKUyO/gLoa9XHDtdtfKyHbBcnypsbC+faqWdpcH+
	 MrEKhbRKE67kQgT9aH9UCtWqKl59dDcEkP/9RjY+XmxqAnuIUVHHt3IH6GeAwlHLhWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ZCbj/bq/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTD4xvli;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F8D606A339
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F8D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZCbj/bq/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTD4xvli
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZClA2001804
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=llfh8etuwqMEBoatS7BG9atT
	A4vpv1pJNPCbkPuzpyI=; b=ZCbj/bq/7etR5mduMsXYp0jpAwQ/AZdMzdYdASci
	VmMJONZ+iJEIUbANBiDjtZphcWabwse7wGo9h645cixX6XcXKZ/uGGfPLJ4JCERB
	e8I7/d5uvjtX6Fw9P/v8ncTMUJg6MECCmrpbVV9qB8RiuOe8CAEq5tV0DSgzvrXS
	ey5Gg1BPNsa8KT+NcxPxPlnh+AJcYxc7TyWgZXzrM+P5SfYUHqybWuG1ftpAHVZW
	5w25MerOy+XYX+KP/GioZbvtfeBkosizv8g9POZL/G7BWgPNt+jueA+IlNyGQM38
	I9qm7lpjucG7INeL2Za54FsOjajj4386I+7u307pJIeOXw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh2yyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:13:09 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99062be02ddso501684241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406389; x=1795011189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
        b=WTD4xvlimwMrg0z+1mJjTCXHFIUaicF2Qp7y0bhilWeVCOAyP4dGnKk1LjpvQEqb0K
         mKGyLWJY+McuA8+6xUgewkZsD80mnA8jX5OMvBY1LDF5Z6TH53K9v4fnUGdnyZnbBKhf
         dRfafsWkFDBJ9TlhzuRfcudpB7IBDdsZ6/ZGWUiS3Ht7HL9KA/SBfTmCpZBSL1CP7iSS
         G1WoO1o3qrPDToUWad/WpmUKlL4mvBg3dVizS+fH1eguutNuO0rlwJ2hiEuc3Y7hoF03
         T2n31CpVHeQiTKGr0IYARsxSQIDwqSLKDXLmdUVG43AyE/EmSZZxmv1eJ7azpoGy64QL
         vtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406389; x=1795011189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
        b=21ROjzZrguAaXP2yLU3msqfyAuxyiPG6eb8Jax7WDSjmFPHIL8GdByrwH2QVvuMTJW
         l+2RedljFTL/Hsq8X4wauLTz7dMOxgU13VESkeuX75kLV87n8nyYORRDIbrASak6kSS+
         5g3Vbkkr2bxlpQkPr+U5ko+ZQn5zU9K0Dd8Tqz0zmZ8RfoOgayisDXSKp9l9A74tHIZe
         6kWXPc9aHDMDK7sLFLwF60HyxVxRqluzb7Ul03864rhmMVXeEXPydrxIZ3K8IKjAffX0
         7nMxJZ3U0mUyt4hBPcYDNruUhuQOvOCLlReAs/cUVlPK9Gi8pHzIJ+vVU9MP8ci8vLY3
         ig/A==
X-Forwarded-Encrypted: i=1; AL+hErHm0pugniST1UuVQfzoDUgWyIzVbF2I1dMhM3H841nkQdkRUtyqCT6JILQZCki7iYrxhpaA1IYNtwwAFTWv@vger.kernel.org
X-Gm-Message-State: APuU4Z/9k5J/3rz1Zq5LOWaiWIG5YDDv711uvSHwvY23yZl4vBvcm16K
	3EHPt8VX41G61pFuAF1ggLDbKKU7KSkAfNWTDY8zc2Wdx4SN5F20mUaKmq7PhWBoAxNFGqrhMoc
	pn6Oy//7XYJoQ71gbzvNUysqoURbskonTPD1XZn6fHxakhonz9khvhWLC6tDZndz8srqZ
X-Gm-Gg: AYBFou2xWlMhjKWeiXn1XNiwu1ze7jMcEWgGYLlAx8AT12jk7H1V7mzcQp9WS+dEyOr
	uiH5WBw4KRLiJReCn6+mkNI+nxgYxDcf0ZTnE69d71AFDweyEhp11mPrL1Bt6kAqyL+wWNuDuFn
	g8D7nLNRFkZb4xEPv34v5Qp2y+nfmSE6iHKBgNvAKk/7UQaB7phdUiN1IICJa/cBBtzsrWYBORT
	OXDaIzjiX9rf1u3CRdRqj+LFeTRzNFJmjmAN+Le+l2VDheZE2cKced1cxYLmpg429es1qSRvIaN
	YE12frjWPLcZ5P3BYrA7OsitxujpeQI3RuVS2Ou/gqMFrJC4xBMR3hph2XmbrRL46Ha4HKfvYL2
	bR8tQ6V7wwQ8v3/ZDxaaRSAm+SejdEHTH0ASQyZTCXmEr36CTTdl8/toELBWVdGgQsksv8PzVPm
	amEOGRG5X2l3yci7ZFv2aX1Q0tvNAteVMLtI+8SRxuG7g4redxVk5f7zjC4t/8IQ==
X-Received: by 2002:a05:6122:1b09:b0:5ea:94cd:c5d7 with SMTP id 71dfb90a1353d-5ee1c462ffdmr791571e0c.16.1794406388829;
        Wed, 11 Nov 2026 06:13:08 -0800 (PST)
X-Received: by 2002:a05:6122:1b09:b0:5ea:94cd:c5d7 with SMTP id 71dfb90a1353d-5ee1c462ffdmr791529e0c.16.1794406388144;
        Wed, 11 Nov 2026 06:13:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb7839sm956114e87.74.2026.11.11.06.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:13:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
Message-ID: <34hgm3yw4z4kbulvgpg7c2iunyui5ljn2l6fqq47prc7s6hycn@c2rnwvhcn5x6>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <fzchmbho74ii6d2zhzni4qy4g74hiwv4fwf5xudrqdrstt6klm@7wdoo4acr6fm>
 <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
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
In-Reply-To: <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX4G8DqbsdBkn0
 mNg8mRTVXxGDK1LiF0YJEJEEykpD1KoMgt385vzb/yeKJst+YpyVeZoQe9CpbSbeBxh8L/i2OoP
 JneQpmJt5kg0n5WF1BH3/7OfzSb0aPU=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af477f5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XCsYekLr3cgse1I9aysA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: psTqFvxW3e_s39DO00-xail8SP2QPOW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX7DcaqyAN7iCQ
 JlRKFTGj7Z2REjJhyrxTX3q3WXCNRczF7oBqLv3qDMgEUC7uc7wDWYzN0RowyxrWk8HP4Mnx9YH
 M+IAJ2tB4Eejkgr1E4C5QYPUfTTsIoBAKkga6ZlAAbtA5w5ftYzNEcRlcnpj8F8vD/jcuoB0wLB
 Z2/92Gck39rLsC8FbJxfUZiLKhIaliAvh8ty0/05PYwT6odf3suGbFRp1WVMMpj1Zd1h+aEWECk
 nLstygiOI35UI+drNlbwtK0ief5F455Fmq9ycKg2mvt9LkyTgk0/0kzNUUTWRbVYe9zJnl6WCN5
 3yIP1TvKVrDs/NzjsnjZeX+/cMC5403yjsS//TyyC2AukOyi088NP7NmPudwDeOqdFzQOQI9Aam
 jpQ3LuQXD8ELZry8YT2SZAFhm91F4dKVFGi8T6TcxbeS1jra3zz6fNjSD/tNlQj9+5MVU0la6Iw
 9b0KOLIxE9nmkjgJfdA==
X-Proofpoint-ORIG-GUID: psTqFvxW3e_s39DO00-xail8SP2QPOW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110056

On Wed, Nov 11, 2026 at 12:38:54PM +0530, Jayant Shekhar wrote:
> 
> On 26-10-2026 15:27, Dmitry Baryshkov wrote:
> > On Mon, Oct 26, 2026 at 11:51:11AM +0530, Jayant Shekhar wrote:
> > > DCP platforms place the display pipeline under firmware control, so Linux
> > > cannot discover display resources through direct register access. The DRM
> > > driver therefore needs device-tree descriptions of the Qualcomm transport
> > > wrapper, display topology, IOMMU contexts, and panel connections.
> > > 
> > > Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
> > > subsystem. Document the IPCC power-notify resources, transport and
> > > framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
> > > DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
> > > after the IPCC power-notify sequence has completed.
> > > 
> > > Assisted-by: LLM
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
> > >   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
> > >   .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
> > >   3 files changed, 334 insertions(+)
> > > 



> > > +
> > > +patternProperties:
> > > +  "^dsi@[0-9a-f]+$":
> > > +    $ref: qcom,dcp-dsi.yaml#
> > When adding DP support, would you add more devices at the same level? If
> > so, we risk getting a warning about multiple devices using the same
> > address.
> > 
> 
> Is it good to model each firmware INTF as a single interface@N node carrying
> the INTF reg, with the protocol-specific DSI or DP description nested
> beneath it?
> The driver can then obtain the INTF index from the common parent, avoiding
> duplicate addresses across protocol types.

Yes, it might be good, but it's not what is happening here. You are
adding dsi@0, although, I guess, INTF is 1.

> > > 

-- 
With best wishes
Dmitry
