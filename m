Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673895;
	b=e1+YmeEXnhb/ct/wAq3tb7Iwbz4LT+KdVd/HgRuB0vAh3wDUxtoQ3OFtAISrS9aHQ7Qv
	 zjrIC1FRtfFj5XwjOQndIJV5G/B4g1vLCrZFY/HmuPphcK+WpFINBRlgF0KRpZjxXyOP1
	 Y9mfkavga1nMRq2oU5u5ZLfwhuCMc0CwOSvK3gqIiqLDGy5QgbSHFEOau3eBWdQN8IQvf
	 8qiUBsG7pCWSNE63Jg2p56RRIDi31I6b/kGcW3xpnAlldFUOh8tMuawhPz9TDkbLy7u9H
	 JyNryo5N3n0K9Hcbv22Yb2ysJh86G+l7eLf6xG+TMdbjENqzeYsw13Qgn95vu+FoeOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9FguR4Y9REKsLqd5puEfsdMDxnefQWyFrONNXRh4S0s=;
	b=s6D+qLEpEXV+JRwGHfUpZu41vo6C3+FEx1su500xIJjqif+ub6MJcxCUat8tBQ8hVdmk
	 ev6wY7mtblgWY+HbUX/6/ARA3xyga45sok/T/BbffUMrMo4606ANRrhnOAkLIvFA1/9C3
	 aiisRkwsmp7pCBPyqw3ElC6BW+c34zYfN5l7dpJz8bNvu4tsbfSs+EScc33s3J9BFuNkE
	 1VDUe64LCcbhVZxDYlSNVFqr4MQLfFIl6TnGF0M9dA49Ah4gt/sAzxFYGrDoHw05RtVRM
	 uhGq8sMevX0SPpBuV/BbiYxhBMFW6g906ik7k/mBZTlnS9alHODoKpqdkqJj2p2wm9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IcjvRbsE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJ1Wezrw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C9B606A32F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C9B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IcjvRbsE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJ1Wezrw
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06tS3427084
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FguR4Y9REKsLqd5puEfsdMDxnefQWyFrONNXRh4S0s=; b=IcjvRbsEDpPZe3B3
	fum8AuvDyElNqwUPsU1l0gghKdlbH7EVI9AU6ZSXLI+z4qBdKJjLCG9Su5TCi4HE
	J6KMS3EDFyrk5djbxlQlGlBgy6ZKhxIKur8rBMkTlkzzii28nAtd+SogGK3xAkXl
	wuaQl18eDtFzMR1xtGETxHZPXHDaLbvxYSXYio1hVMJtVsPjGLU1CwBwbLE11c0J
	6/rsAmuDMuXLXbo3WmhA6q2z+RFL5EBIDbX2OPwtfXmOELvv9gh1TNPdjEBEhGzb
	eYxgwdRfv48KaH9E1OHiF80L9aiW6h9iSbRbiT61Beu7EXqkyc8VekY4SrthgD6M
	UNbB1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq27qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:58:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so417306185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792673893; x=1793278693; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9FguR4Y9REKsLqd5puEfsdMDxnefQWyFrONNXRh4S0s=;
        b=DJ1WezrwbbjQpFj+Mbkfod3lQlXjcsc8BWZoX7iF85jKbefWU3DwK/mwYcGhUxzIeX
         IZmNeTBrI4/Yqz/e44RdMjumxINd/ydfKqQAFuoBa5Ej+/ttDjkO5ZrDXap1CpH2nsja
         frjKg3B8Ymqs4Zensn0VqPuRMJCBitY+9ic4eyPggVbv0YsJVIowNDfzfboi+uXJLLIv
         kt9/jlCwyUlEAqpI7kIqxum6c4HqV4M4V3UGHxg72AbiX2jSgEjbIzSINAM84HWJ0pLJ
         /7dgT3x9oTVBEIh+jV+qqj7vWXTwC17AMgRIYFoq6Sahglz3JxqBYVHBtz4KG+bFxxYH
         CZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673893; x=1793278693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9FguR4Y9REKsLqd5puEfsdMDxnefQWyFrONNXRh4S0s=;
        b=Tq97M54TSgr1iS1ZsjGSEwP1uJAOsjJBh0THQJR/KcPcH0vAIk/HBX7+eLkrbqfWSC
         upw1lcxhbpCH3S8XXXmF4v0YhNVsv1Pq/shC/a0gw+L6fid0Mx7RLub7unDSPNJy0/EO
         Nn1OcV54vSHWKG9bW2D33OJrp/n4YIDvUIChSXP5QVqeQmS5DUzpfTRbyNq6zoscFhSE
         YYEhD2deH2wK82m4s5gFwUyGYa6jk4THn7cOBna7T9JXtCYY7fj98nbzhx/HIJIbN6oZ
         Epb7dMgqK+PWoc1jcrt8TgPyXrO1pwSTBXeUKnCUXsJoRBupU2X63UGtggZfSgVDcopT
         w5TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxREjo+EX/iDLQEhizx9mK9UiOQ2+tP83eg5JN2eEgXdvbWb1JdG+b/uh0Sh3r6CKG57f5nuh70DQRrxkau@vger.kernel.org
X-Gm-Message-State: AFq9FYJVQiEpMA5UPkrLyVjmG4hHt2sWUTx/ePLldoIxNcHMN7dTBlSL
	dKEkWbRN5KX6CT6vv2nht0o2YouFlOkh1xJgz9+ytWcyb/HSZg+vRq7IEAmeUyECrDGWx8F7mcX
	my6EsrnO6NZ6Uj2Uj0ho5Qb9SMNocRw9U4zFfcNwVfY/q+3BXmL+aSnxYt+anxYcOTS4Y
X-Gm-Gg: AYBFou3JZ/WziwKQFW38gYKopEQLzYJ/7gXGDdCx6IKfRCSE4JAuyVhBZpnk4LpgRVu
	ryklS7J89BlksE2HGfn26LUvvwF/tVPES9CYQcF17qCLXB/fH9AWkho4HQRb9hUDIv4RVZt9tc1
	Z0pDg8EeTuNUP1D9G33tek1aakNTwEdG4ZP22dfRR2EHO7g8PnK+9jBaHOHtbcBGBADnjwig9o3
	NKo0Vu9us1Y5vUMTHJcmKcPYw1gohAbF0o1UKfUjKS487SZ/lPsK9gyfZem2VrEwTKhwEupgME2
	tMhgfK0l5ls3/3OSZ/hpMMWnznRtr9kOQ5GhUU9gy8NvjtLe0kjBPvMj1zZ4F0XRIlWAivtPTCj
	+VyyuflwAr6HAEDFYeWG+8nWL1HYn4qXL6VLyGk7iOUv0fIQ3PZgsVFGBmCfondqMJr2oIKDATx
	zPWKqttFoQhFRs
X-Received: by 2002:a05:620a:31a9:b0:93f:25c7:a4e1 with SMTP id af79cd13be357-93f57f707e5mr913569985a.26.1792673892936;
        Thu, 22 Oct 2026 05:58:12 -0700 (PDT)
X-Received: by 2002:a05:620a:31a9:b0:93f:25c7:a4e1 with SMTP id af79cd13be357-93f57f707e5mr913564085a.26.1792673892359;
        Thu, 22 Oct 2026 05:58:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f668daesm7972101fa.29.2026.10.22.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:58:11 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:58:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev, virtualization@lists.linux.dev
Subject: Re: [PATCH 01/13] dt-bindings: display: msm: Add Qualcomm DCP
 bindings
Message-ID: <56bhasxfgn4tpok633n6ho6x5h5jd4tcivmtj3dyppje264dco@5bkmz7kxvsfm>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
 <hprf3vrsveovq3hwcgjrfj6uhmlxlq5u5bx4lkbswgxe476qwz@pacalsdgrjx7>
 <ea81fcc1-c7e4-4b80-b65e-f483487bd1a1@oss.qualcomm.com>
 <f7926ef7-1edf-4d74-9758-2ee0c8a795bc@oss.qualcomm.com>
 <b7kf23jpwkqhpbmytuomofiewx34qxrjn2zqq3ydhnl4jk2smy@bb7h5vecnnag>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7kf23jpwkqhpbmytuomofiewx34qxrjn2zqq3ydhnl4jk2smy@bb7h5vecnnag>
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada0865 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=Y5PERNx5PWNQqCU0_wUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: GUWJuYRg7bypL8qOfIWqNpyl7uHTsnTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MSBTYWx0ZWRfXy9ZpOLxcGu7I
 Jrz4u59vabdwRmIhsnTliNvjRbUXhNgH5VQZhGcQwJ+BGKyEJrRHQf0JESLmBrGyXuQTVWOqY6G
 OEV66wfGSaWKi4+ilY9BA/eAi3u2H3BFbMtN3pGQKFG/YjmU5ZmqvLnSOLTRR7oWN3ZQHcAHx2v
 BLNYX67VNnQAEsAVCukLygwuOQ5mHzy8QzvxnhL2lC0VNRP0K5H3zOMsDnjwaUc99OlHxb0qNYR
 VJXsX3FxOHPpeYpffs2aosnIq7BvvQFK6dmIfQsknONCM+QWtJGRwMQ0eUwuhoNSIWavXoo2oeL
 iSTYwcD1E+/BPGLFZqeFgxiXYqNs8j/wWV9ndWOFPg9hZrPha/qpkVFXn+vmzilwLLRt1lj7bfJ
 73G2gupsIZF+FXvs1Y2nxoDUJNk3HQ==
X-Proofpoint-ORIG-GUID: GUWJuYRg7bypL8qOfIWqNpyl7uHTsnTA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MSBTYWx0ZWRfX0UbhGP+TZnhq
 gVSLVfWg/bCSBdsQxfDKzljQygp7b6A79TKlowGEBPW9HDEj30lx2MeSjF78GWD9p6GYezI0TzF
 eX7pxhNrmJXRaATPi2pj6rIrcTG4zow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220051

On Thu, Oct 22, 2026 at 03:52:17PM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 21, 2026 at 05:09:15PM +0530, Jayant Shekhar wrote:
> > 
> > On 21-10-2026 14:15, Jayant Shekhar wrote:
> > > 
> > > On 15-10-2026 17:47, Dmitry Baryshkov wrote:
> > > > On Thu, Oct 15, 2026 at 01:08:21PM +0530, Jayant Shekhar wrote:
> > > > > DCP platforms place the display pipeline under firmware control,
> > > > > so Linux
> > > > > cannot discover display resources through direct register
> > > > > access. The DRM
> > > > > driver therefore needs device-tree descriptions of the firmware
> > > > > transport,
> > > > > display topology, IOMMU contexts, and panel connections.
> > > > > 
> > > > > Add bindings for the Qualcomm DCP VirtIO display function,
> > > > > including the
> > > > > INTF graph and DSI host outputs. Document the framebuffer IOMMU
> > > > > context,
> > > > > IPCC power-notify mailbox and interrupts, firmware display
> > > > > topology, and
> > > > > firmware-visible IOVA window supplied by the parent VirtIO-MMIO
> > > > > transport.
> > > > > 
> > > > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > > > Assisted-by: LLM
> > > > > ---
> > > > >   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75
> > > > > +++++++++++++
> > > > >   .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113
> > > > > +++++++++++++++++++
> > > > >   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119
> > > > > +++++++++++++++++++++
> > > > >   3 files changed, 307 insertions(+)
> > > > > 
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
> > > > > b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..f7178c66c09e
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
> > > > > @@ -0,0 +1,75 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Qualcomm DCP DSI host
> > > > > +
> > > > > +maintainers:
> > > > > +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > > > +
> > > > > +description: |
> > > > > +  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
> > > > > +  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
> > > > > +  Qualcomm SoCs, not specific to any one of them; Hawi is its first
> > > > > +  platform. The DSI host and its connection to a panel are described
> > > > > +  using the standard DSI controller and OF graph properties.
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: /schemas/display/dsi-controller.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +    description: Index of this DSI host among its siblings.
> > > > > +
> > > > > +  status: true
> > > > > +
> > > > > +  ports:
> > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > +    description: |
> > > > > +      port@0: Input from the DCP virtio device's DPU INTF output port.
> > > > > +      port@1: Output to the attached panel.
> > > > > +    properties:
> > > > > +      port@0:
> > > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > > +      port@1:
> > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > +        unevaluatedProperties: false
> > > > > +        properties:
> > > > > +          endpoint:
> > > > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > > > +            unevaluatedProperties: false
> > > > Why do we need OF graph here? Would it be enough to link one of the
> > > > ports of the root node with the panel's input?
> > > > 
> > > > > +
> > > > > +required:
> > > > > +  - reg
> > > > > +  - ports
> > > > > +
> > > > > +unevaluatedProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    dcp-subsystem {
> > > > > +        #address-cells = <1>;
> > > > > +        #size-cells = <0>;
> > > > > +
> > > > > +        dsi@0 {
> > > > > +            reg = <0>;
> > > > > +            #address-cells = <1>;
> > > > > +            #size-cells = <0>;
> > > > > +
> > > > > +            ports {
> > > > > +                #address-cells = <1>;
> > > > > +                #size-cells = <0>;
> > > > > +
> > > > > +                port@0 {
> > > > > +                    reg = <0>;
> > > > > +                    dcp_dsi0_in: endpoint {
> > > > > +                        remote-endpoint = <&dcp_intf1_out>;
> > > > > +                    };
> > > > > +                };
> > > > > +
> > > > > +            };
> > > > > +        };
> > > > > +    };
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
> > > > > b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..018694310dfb
> > > > > --- /dev/null
> > > > > +++
> > > > > b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
> > > > > @@ -0,0 +1,113 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-virtio.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Qualcomm DCP VirtIO host
> > > > > +
> > > > > +maintainers:
> > > > > +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > > > +
> > > > > +description: |
> > > > > +  Qualcomm's DCP VirtIO host provides the generic VirtIO-MMIO
> > > > > transport and
> > > > > +  the host-side IPCC channel used to wake the DCP firmware.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    contains:
> > > > > +      const: qcom,dcp-virtio
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  iommus:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  iommu-ranges:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +
> > > > > +  interrupts-extended:
> > > > > +    minItems: 2
> > > > > +
> > > > > +  interrupt-names:
> > > > > +    items:
> > > > > +      - const: virtio
> > > > > +      - const: dcp_power_notify_irq
> > > > > +
> > > > > +  dma-coherent: true
> > > > > +
> > > > > +  mboxes:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  mbox-names:
> > > > > +    const: dcp-power-tx
> > > > > +
> > > > > +  dcp-subsystem:
> > > > > +    $ref: qcom,dcp.yaml#
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +  - interrupts-extended
> > > > > +  - interrupt-names
> > > > > +  - iommus
> > > > > +  - dcp-subsystem
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> > > > > +
> > > > > +    virtio@9be8000 {
> > > > > +        compatible = "qcom,dcp-virtio", "virtio,mmio";
> > > > Is it really compatible with virtio,mmio? Can it be handled completely
> > > > by virtio,mmio?
> > > 
> > > 
> > > There are two possible approaches:
> > > 
> > > Option 1 — Use the standard VirtIO-MMIO parent (preferred)
> > > 
> > > Keep the parent as:
> > > 
> > > compatible = "virtio,mmio";
> > > reg = <...>;
> > > interrupts = <...>;
> > > iommus = <...>;
> > > iommu-ranges = <...>;
> > > dma-coherent;
> > > 
> > > The generic virtio/mmio.yaml binding would be extended only to document
> > > the generic iommu-ranges property.
> > > 
> > > The DCP-specific resources would be placed on the virtio,deviceXX child:
> > > 
> > > dcp-subsystem {
> > >     compatible = "virtio,deviceXX";
> > >     iommus = <...>;
> > >     interrupts-extended = <&ipcc ...>;
> > >     mboxes = <&ipcc ...>;
> > >     mbox-names = "dcp-power-tx";
> > > };
> > > 
> > > The parent uses the standard VirtIO-MMIO interrupts property. The child
> > > has one DCP-specific interrupt, so interrupt-names is unnecessary and
> > > the driver uses interrupt index 0.
> > > 
> > > Option 2 — Add a Qualcomm-specific VirtIO-MMIO parent binding
> > > 
> > > Keep a Qualcomm-specific compatible such as:
> > > 
> > > compatible = "qcom,dcp-virtio", "virtio,mmio";
> > > 
> > > and extend the parent binding to describe iommu-ranges, the additional
> > > IPCC interrupt, mailbox, and related DCP resources.
> > > 
> > > However, this approach duplicates the generic VirtIO-MMIO binding and is
> > > only justified if the transport requires Qualcomm-specific handling.
> > > Since the DCP transport is handled completely by the standard
> > > VirtIO-MMIO driver.
> > > 
> > > Which one do you prefer?
> > > 
> > > I will be addressing other comments in v2.
> > > 
> > > 
> > > Thanks
> > > 
> > > Jayant
> > > 
> > > 
> > 
> > I think Option 1 is not suitable because the IPCC power-notify sequence is
> > required before the first VirtIO-MMIO register access. The standard
> > VirtIO-MMIO driver would otherwise probe the DT node directly and access the
> > registers before Qualcomm-specific initialization is complete.
> 
> Good. Which means that dcp-vrtio device isn't compatible with
> "virtio-mmio" and can't use it as a fallback in DT.
> 
> > 
> >   Would the following Qualcomm-specific transport approach be acceptable?
> > 
> >   - qcom,dcp-virtio is the DT-compatible Qualcomm wrapper. It initializes
> > IPCC and sends the required power notification before creating a synthetic
> > virtio-mmio platform device.
> >   - The unchanged generic VirtIO-MMIO driver probes the synthetic child,
> > accesses the MMIO registers, creates the VirtIO queues, and registers the
> > VirtIO device.
> 
> Why do you need a synthetic VirtIO-MMIO? Why can't you register a virtio
> host from dcp-virtio? The driver is not designed to work in that way.
> 
> You have two major options here:
> - Copy relevant parts of virtio-mmio to the dcp-virtio driver.
> - Turn the core parts of the virtio-mmio driver into the library, making
>   it possible to share the code with DCP driver.

Anyway, please cc VirtIO maintainers and related MLs in v2. I'll add
them manually in this email.

> 
> >   - The DCP VirtIO driver binds to the resulting VirtIO device through its
> > VirtIO device/vendor ID table and initializes HFI, firmware capabilities,
> > and DRM/KMS.
> >   - The virtio,deviceXX DT child is discovered by the VirtIO core and
> > describes the DCP-specific IOMMU context, DSI hosts, display graph, and
> > panels.
> 
> With your suggested codeflow, what happens if the dcp-virtio driver
> suspends the DCP host, making virtio queues unavailable? How would
> virtio-mmio know that it should also prevent the access? How would you
> suspend it too?

-- 
With best wishes
Dmitry
