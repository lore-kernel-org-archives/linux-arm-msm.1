Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587673;
	b=1fYs9tQzufVYWY+KfPpIpttR9l2/FrMdl2mLHYSjpMG5HSLwH47k8KMqu+J2tYlVY5Pv
	 GNxqUAz/xNVuX6IjfA5NVHpyP32CY6xIkcMqXPmFjMIKsVkKD3jBQJqIWhnJj5+EWoq+1
	 YW+C6mMoRbI/FwWuPtwrvq3ozZSR+O1TCRXJrt2SfHCSUQDpi14fMsaB6QzFmeE7KheBO
	 kOMN90uy+fLFinug2jRDGPMCurJmDFXIoP1aGN5d7slkTdIjFbnIvamtjT16RFZ5O6IZj
	 YyIJB190Tom8M0ha9LZ6MwHytgj1bcWWJGEEHTgzSDbbzyZ/a1qffpawOFHTr5Gv7DQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gVHN/KsBNoDpAY9h12G6JNzSl6eNu9q0U6rV/X0S7aE=;
	b=0jER3gQ8kSi9E/3hvWCXM9BGnD3Na6Z8fc3riyLyD11jxxncLmyESguiAxfE346Uf0nI
	 cUa87Axz/hCrRwPW5Zl1ZYsG4dKelPY4pEatbS7LV2yfXGrJtsvndf053JH8owSvMIZTH
	 srh2Bp1RxZGdY9WjlBKblsEBb7ihjj+ay9ZYYvi2jXnl9afltVHBcPzNZaW5cj0tWYWNm
	 SdKzKghgkw/KNdlTK2scCtP718Tlf1lSgPP+z+SXkagfnXbmEwFfflOz0xbtNC7l9Lfta
	 N7oGwn883kcLd4yBiu+J6nAdTpWGPKHZAPOzvLhRTmxxDZiSwrbc5F0FHlUsosJlDiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtE8uGub;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SgB/cSWU";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB056606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB056606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtE8uGub;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SgB/cSWU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg64a1599989
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVHN/KsBNoDpAY9h12G6JNzSl6eNu9q0U6rV/X0S7aE=; b=HtE8uGub3OuGwgUi
	LN4O1pHtrxZhZHfwkbZAYh56Waz3+wzJpEIkMSpjAu/Vbt6wT9CEqEm6Z/GyQ9HO
	zBd12tdyz3Nnm9ltd6Zf1TgU/xI/QTj7Tizc01Sbz2ZpyhbrYdnlKykwZdeQq1is
	7SfpCLhApJupbVSE7EHVAWEm10gcTxxWgw7EHUAbnZsfKuI8r/fTJJ2MGFX5hKtY
	ywj97sa03Oi2TeuPau2XLUbpJzFu9uUeGQRp/Kd3YolAPWIUU7KjE2iv9bBNcL+7
	IPtCe/vzjtcMSPh9OAX15PfKK8/3s5CNxmw5k1nI+qmQRGwkuuqWt++lHci6DBYD
	o9M96g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhugh22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:01:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f54f15b9eso165167185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792587671; cv=none;
        d=google.com; s=arc-20260327;
        b=oBwo6BsAsZ+e16LJyaHN+RnNaCs7lEJtWuFbEZKAkAzws/qhX6pWCx8Z+6EI9XfNmE
         Ir0L/hXnUJrdIzIVCmBk+yUcnCNXZ6+CfA7LPRMExiAkplNdUrEZZ5+wu50eztk/fbkD
         JYaJwmSy3zPBjYSOhh//Cxc+PHe9ip101pGocdCleSxMJvAYY8uqKSkMVVMeJsUlLN+X
         o/bRZpQj2jn6V9Y0xkKHEshIRAIyRFfYer7jnVeL4M0hLKFzWsjU52eSwj4VSgEzIsiD
         voAWS+/Vgjgw0IJCrsDzmVdaf+XGAIlcmnePzV70CKTs8sNUtwmEf3h9w9+eMS6P/3bz
         OP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gVHN/KsBNoDpAY9h12G6JNzSl6eNu9q0U6rV/X0S7aE=;
        fh=J/jqXlM+p1/TZPJf/uud4P6Oe/0+kqskcPoU/WiXy6Q=;
        b=d/68f+9NCRe9KZHLNJEg2Zu6hGIKT/puFTbHLh3kb0PNdWLLlBEx/yf9mpP7sCxHCX
         Zw2EOCaFqTKOmbzqCdqc8cN0bIDxcbPHaubWPOumVHWmbW0fwuEGoBaguQSltBCuopLV
         P0DnjnSIL5r0f61jlQx1aCF0D1+0Rv2rgG2uPbycm7W/YgW6m0fIBxSGoChw+uJVF7Cb
         Y6q+X/K0iJIOn7+bIrzUQcEeNSKEgfiac7hHtZtfaLJhZrONc9lVUarh7F7WVocbpEmu
         qF5UUmr9/rLzwn3AUGP65xUhebEtplJX/n4FAGPfvPHRsuHbb77Z/GCe8K1opCcS+7m8
         vAZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792587671; x=1793192471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVHN/KsBNoDpAY9h12G6JNzSl6eNu9q0U6rV/X0S7aE=;
        b=SgB/cSWUfMwzX9jzioMGehsV6S7KOjv3CewjcVd25++HBpxbOeIFxnKgXW85UJmCMA
         y8LVbmsP4p6s+7MkVC325Ae8bKctrmOh1RtIbicYNKXRLECBhJ+W340R2A/rj3Sj9ujZ
         Dley8hrYcyxEElSepFIOvkP3/WazjKQuBuW0bCMyHcdw+WGUj9VFxMs+I35nTppTagea
         24veDA/pwfdDP3058+S/9W8Kzn3uPU429EH8XNT2tDsjWx2d/KNvlA2zOFpSWrtjUtJ5
         54Gtz/xeGp2O4wqGNsszPRidPXa21e4IQdRkHQvxIryDOb21rZBCOa8FlSxvjJRBbGRV
         EUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587671; x=1793192471;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVHN/KsBNoDpAY9h12G6JNzSl6eNu9q0U6rV/X0S7aE=;
        b=Rz+OTIHiB//9hG0NVKZ+xWLx+QdyLbi0DdjkOU1OvNFCKPRrtlWDZTygDCOQd7LIOP
         ZAzG9xCY0sDZ2ROP/u0LS/Uil5lvKIxnWcoEMw/WZ5vvhWTHkPwltVuNtj3sxYgFZVea
         9wXoiV1lw9w6O+5IOgZ0igoAc6L4pMUdANNOX/2Yxp4PHp5z72CePr+2I/4vxFZn2C0C
         YCMvwFuCWDfZNsio9+8KA4fyEoWXNmA5FzDXpxU6/hOpDzLXQ5ShXJ4UAH9pjlWv59QC
         f/+46IqvwRP04vFYsTXf2F5DaeHUsyAM5ZHxj+eGUFOeoSttWM25DvCsKgsreKq2j9sL
         maiw==
X-Forwarded-Encrypted: i=1; AKwUvBy/tnX8j08lxs/vVc2ZG/PbZWdUA0T/8ipdmwbCKMjS9L8cgf4hjVNseY2H3kl4ax8SAt4Ija4l8aC7e+Qc@vger.kernel.org
X-Gm-Message-State: AFq9FYJrQkLiPENd/Zq44oZ58JE8e57sXWGB+d0VlR4FSFEXMvM8NxUI
	h9Hi+2wfaEiEdjZqJ76O3jaa+27o2WiEc4PLOG7hXKUD8XMZ6scsc08dvfp8toBDEz/kH5xaAZM
	KPWmyLDRLZg3MJGp2DtaQY/OGXRpdcKgeAxp9OCInsPq2C8/3lFfqYWhC2qI9HQJzSzIjJPN3+E
	M0xnFxFvWb9lH6t2JY4/2Xc4mRs2MF8qX9ZvJCnTS9RnM=
X-Gm-Gg: AYBFou0XzlaENjdQ+I5mwLReRHKhcX9tGydlFeRI+wcva0Y3qaDJIjSjWhnS8JlCxE8
	r4P5mv+GJxK3JHZOFWbxguYWlX0i5Dnv7UaIN8muBGcMRjtjjDkuHR5889uf1Eb8fyphadin6rG
	Q3Wf+/xQVNpPuyzB4Rn2WrXZ6wGVcirPclcP9L30MscyfuttbO8smesa8ZVIdnsY8zsAWpLT3w5
	tvEWaMYYMDc5YBkktxqiUMPM395wgLbXGH/2iBbvrfRGE2f0N1yxYRdC2mPgvhJF7BIf904els=
X-Received: by 2002:a05:620a:394a:b0:93f:34c9:9248 with SMTP id af79cd13be357-93f57f04eebmr415407885a.22.1792587670489;
        Wed, 21 Oct 2026 06:01:10 -0700 (PDT)
X-Received: by 2002:a05:620a:394a:b0:93f:34c9:9248 with SMTP id
 af79cd13be357-93f57f04eebmr415365085a.22.1792587666477; Wed, 21 Oct 2026
 06:01:06 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
 <3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com> <dbde0e35-8246-4f69-b3be-cd617a1767d9@linaro.org>
 <c1a0dfe9-34bb-4d24-9644-0f758aff0af0@oss.qualcomm.com>
In-Reply-To: <c1a0dfe9-34bb-4d24-9644-0f758aff0af0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:00:54 +0200
X-Gm-Features: AclHuK-8q0aX4k5XsAnz-t3dRuV7UwkayPffcJ2itPbwK18KPuujnhjZ4aFGTag
Message-ID: <CAFEp6-16PUJzLKZUBrC2g7oh8pN_Tygrf6wYX53nL+YM4ZvunQ@mail.gmail.com>
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8b798 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=DWtyPYmOaO5ShKUgkzEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX6rC9gHhCrGBv
 mVVPriqemaui0XhoA76vffU2Wd4Rd9dBmgCaZtn3T+uVbMIEUYTuJeJzLWONNC6YvbXCDhSDrLW
 tMUptwYsrPR/s42LIZn0GEi+yXWc4h0=
X-Proofpoint-GUID: F2S3EDCsmE2IN9OAH8yUj-JQ2_kZVVGJ
X-Proofpoint-ORIG-GUID: F2S3EDCsmE2IN9OAH8yUj-JQ2_kZVVGJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfXx1kT/vB/E6f5
 XihZ1GlrPYVqk1hzJBA+YdP8EOzcEMq4lwuVFvvgrbAXiENOVPiKmb1I+wZ/1tIXEo47WwYo8WX
 eFa1aWUYvdlIoPkHX1lfpHi6VPS4wGu8ospML+PjUGKQzdEy9CG7i/sqDkRDaZOSoqgXMkeoZgo
 rJ2oX5WmIpebMDXOK4fTzfjyHG+ZcoyNTpIlm6l+FtYnXudDDWenEpFzTltBSxF3NPzi4RHyDAO
 L/f9IKRbtzYsTqGd5oMEkDLI6hciIWT5yoiundOADQRef44YrK8irpY3ZsPh0c6FQfCdHYOLWFa
 317X8hSGtnNA2skE/LJffIX4ekKSZwfAuY/CunsJEb1MjEttYIrqSVznIpWefzB4oYmsJm/cOsY
 NFVxyJih9LuymaXoHtrZhDbcg0zbSjwKfnJoq8yakhfmmiqCKN+GYExlx1IYvnkIcMQXqXaLvJZ
 IbdrOXRJEdnjLwECw/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210051

On Wed, Oct 21, 2026 at 1:24=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On 10/21/2026 4:53 PM, Bryan O'Donoghue wrote:
> > On 21/10/2026 08:37, Wenmeng Liu wrote:
> >>
> >> Hi Bryan, Hangxiang,
> >>
> >> On 10/12/2026 2:45 PM, Hangxiang Ma wrote:
> >>> On stream-on, CAMSS starts the subdevices upstream from the video nod=
e
> >>> through their sink pads, so the VFE is started before the CSID.
> >>>
> >>> Starting with CSID 680, the REG_UPDATE is issued through the CSID
> >>> rather than the VFE. However, vfe_enable_output_v2() still issues a
> >>> REG_UPDATE after queueing each initial buffer, before the CSID has
> >>> configured the stream. The VFE then never signals BUF_DONE. Therefore=
,
> >>> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 6=
80
> >>> and CSID Gen3 instead. The operation happens after the RX configurati=
on
> >>> and before the RDI path is enabled.
> >>>
> >>> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected t=
o
> >>> the VFE sink pad implements the reg_update callback. Platforms whose
> >>> CSID does not provide this callback, as well as lines fed by ISPIF,
> >>> keep the existing VFE-side REG_UPDATE.
> >>>
> >>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> >>> ---
> >>>   drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
> >>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
> >>>   drivers/media/platform/qcom/camss/camss-vfe.c      | 37 +++++++++++
> >>> + +++++++++-
> >>>   3 files changed, 42 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/
> >>> drivers/media/platform/qcom/camss/camss-csid-680.c
> >>> index 345a67c8fb94..556cdfef6207 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> >>> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct
> >>> csid_device *csid, u8 enable, u8
> >>>       writel(val, csid->base + CSID_RDI_CFG0(port));
> >>>   }
> >>> +static void csid_subdev_reg_update(struct csid_device *csid, int
> >>> port_id, bool is_clear);
> >>> +
> >>>   static void csid_configure_stream(struct csid_device *csid, u8 enab=
le)
> >>>   {
> >>>       int i;
> >>> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct
> >>> csid_device *csid, u8 enable)
> >>>           if (csid->phy.en_vc & BIT(i)) {
> >>>               __csid_configure_rdi_stream(csid, enable, i, 0);
> >>>               __csid_configure_rx(csid, &csid->phy, 0);
> >>> +            csid_subdev_reg_update(csid, i, false);
> >>>               __csid_ctrl_rdi(csid, enable, i);
> >>>           }
> >>>       }
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/
> >>> drivers/media/platform/qcom/camss/camss-csid-gen3.c
> >>> index 0fdbf75fb27d..830c9c818d3d 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> >>> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct
> >>> csid_device *csid, u8 enable, u8
> >>>       writel(val, csid->base + CSID_RDI_CFG0(port));
> >>>   }
> >>> +static void csid_subdev_reg_update(struct csid_device *csid, int
> >>> port_id, bool is_clear);
> >>> +
> >>>   static void csid_configure_stream(struct csid_device *csid, u8 enab=
le)
> >>>   {
> >>>       u8 i;
> >>> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct
> >>> csid_device *csid, u8 enable)
> >>>           if (csid->phy.en_vc & BIT(i)) {
> >>>               __csid_configure_rdi_stream(csid, enable, i, 0);
> >>>               __csid_configure_rx(csid, &csid->phy, 0);
> >>> +            csid_subdev_reg_update(csid, i, false);
> >>>               __csid_ctrl_rdi(csid, enable, i);
> >>>           }
> >>>   }
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/
> >>> media/platform/qcom/camss/camss-vfe.c
> >>> index 2680a9914765..16a0b5663fe2 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> >>> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm=
)
> >>>       spin_unlock_irqrestore(&vfe->output_lock, flags);
> >>>   }
> >>> +/*
> >>> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding
> >>> this line
> >>> + * issues its own streamon RUP (i.e. its configure_stream does the
> >>> RUP).
> >>> + *
> >>> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs,
> >>> so the
> >>> + * upstream entity of the sink pad is either a CSID (possibly with
> >>> RUP) or an
> >>> + * ISPIF (no RUP). Only enabled links are considered.
> >>> + */
> >>> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
> >>> +{
> >>> +    struct vfe_device *vfe =3D to_vfe(line);
> >>> +    struct camss *camss =3D vfe->camss;
> >>> +    struct media_pad *remote;
> >>> +    unsigned int i;
> >>> +
> >>> +    remote =3D media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SI=
NK]);
> >>> +    if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
> >>> +        return false;
> >>> +
> >>> +    for (i =3D 0; i < camss->res->csid_num; i++) {
> >>> +        struct csid_device *csid =3D &camss->csid[i];
> >>> +
> >>> +        if (&csid->subdev.entity !=3D remote->entity)
> >>> +            continue;
> >>> +
> >>> +        return !!csid->res->hw_ops->reg_update;
> >>> +    }
> >>> +
> >>> +    return false;
> >>> +}
> >>> +
> >>>   int vfe_enable_output_v2(struct vfe_line *line)
> >>>   {
> >>>       struct vfe_device *vfe =3D to_vfe(line);
> >>> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
> >>>       unsigned long flags;
> >>>       unsigned int frame_skip =3D 0;
> >>>       unsigned int i;
> >>> +    bool rup_in_csid;
> >>>       sensor_pad =3D camss_find_sensor_pad(&line->subdev.entity);
> >>>       if (sensor_pad) {
> >>> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
> >>>               frame_skip =3D VFE_FRAME_DROP_VAL - 1;
> >>>       }
> >>> +    rup_in_csid =3D vfe_upstream_csid_has_reg_update(line);
> >>> +
> >>>       spin_lock_irqsave(&vfe->output_lock, flags);
> >>>       ops->reg_update_clear(vfe, line->id);
> >>> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
> >>>           output->gen2.active_num++;
> >>>           ops->vfe_wm_update(vfe, output->wm_idx[0],
> >>>                      output->buf[i]->addr[0], line);
> >>> -        ops->reg_update(vfe, line->id);
> >>> +        if (!rup_in_csid)
> >>> +            ops->reg_update(vfe, line->id);
> >>>       }
> >>>       spin_unlock_irqrestore(&vfe->output_lock, flags);
> >>>
> >>
> >> According to the hardware documentation:
> >> Starting with CSID 680, CAMIF has moved into the CSID. As a result,
> >> RUP is now issued by the CSID and propagated to the IFE.
> >>
> >> Starting with CSID 980, software must also set the SET bit in
> >> RUP_AUP_CMD after issuing the RUP/AUP command. Otherwise, the hardware
> >> ignores the command and the corresponding register update does not
> >> take effect.
> >>
> >>
> >> Bryan, according to the HW documentation, the change itself is
> >> consistent with the required programming sequence. The main question
> >> is whether this is the right implementation from the driver
> >> perspective, or if there is a cleaner way to handle it.
> >>
> >> I have tested the change on the Hamoa EVK board.
> >> Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> # Hamoa EVK
> >>
> >>
> >> Thanks,
> >> Wenmeng
> >
> > OK thank you for the explanation.
> >
> > OTOH I agree with Loic's statement - it is cleaner to subtract the
> > callback and disjunct on its presence than to add a flag to the same
> > effect in reverse.
> >
> > ---
> > bod
>
> Hi Loic, Bryan, thanks for the review. I wonder if it would be better to
> keep the check on the CSID side?
>
> vfe->reg_update() is also used outside stream-on, such as bufdone, queue
> buffer. It must be implemented in VFE. We only want to change the VFE
> behavior at stream-on stage, in function vfe_enable_output_v2(). So
> making vfe->reg_update() optional could affect runtime updates.

But the patch says:
'The REG_UPDATE is issued through the CSID rather than the VFE'

So you mean it's not always driven by CSID?

Also, today we perform a reg_update after queuing a buffer (i.e. after
programming ADDR). However, as far as I know, this is no longer
necessary in recent VFE/TFE/IFE generations. In those implementations,
the ADDR register is not double-buffered and is not part of the
reg-update set. Instead, it behaves as a FIFO entry, so issuing a
reg_update only results in a useless RUP_DONE interrupt.

>
> Maybe the cheapest way is still to check the CSID side reg_update
> implementation at stream-on stage? I'm very glad to hear your
> suggestions. Thanks a lot.
>
> ---
> Best Regards,
> Hangxiang
