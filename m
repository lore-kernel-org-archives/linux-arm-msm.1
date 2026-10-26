Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793018683;
	b=yVb05/OpDRksWwert+Xj1zR4cEOuwoNxADEduE4oqq15pTIzp2uypk+ZTBsQUdT5CK1r
	 Fh8MXxAG8CFnz3cCLd9qBLryzxikrYFMTdU8yN7y223SqiRZKTgkGLnz7h6J18lZspr5W
	 /Lec5J28I8G2jF9oFMqoWwwGdqdFQCrmj6WZbnhjfZarrrsCzvHjSXkyI+0YOw7z2A6VC
	 WPMOWDJvzF+bkMDWYJYCl6GIsE5R+4IaWmN1AnC44oJ6tiQE9IeSS37Qjwv25mKsRBFxB
	 a5Z6P6Fnf7pqoRbpMOLwEnbLnm6sI4p8sZ/XJw1ygf1MNa0N7q7HNzBaW6AaHGtrLfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018683;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
	b=ZCgv6quDaEyuldTetCz5qyz79EN8dPyIoVLqC16xCPEDELLulwFoQDSg2o2IFKi9Sudj
	 e+B4GAsT5/2E49pzVEJOPLhJNB2ZUOyKwBip1ZrrQbFqSTYa3X/dNjPdx9t/kW0Su9HfM
	 /GMAEqCDUOtS014nyv3BfYjMkqMrtL40Do48ak4A+hdO9TTe9Bs6mB/fE9yXpqCgD2sgG
	 I9cfjtMRa7SdL7hziCp1iuNk+FkmN/UKuihrptvF3lFZjmZwwX37aU56WKj75dR2eEvkj
	 zHtRngrhdEBkNfJhyQEzx4GtJpOYZCgduGSvwMEXODSYAeUIkK2Q2PhtMaqViJcaiMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E6qRV9x/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP85lmLh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40356606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40356606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E6qRV9x/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP85lmLh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtYmw1547975
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=; b=E6qRV9x/eE2Fi0yy
	1OvFNuN0nUHooQFKkiHdYWd1HhCrRBTAdNZlnrcnnzwFMSO0mnuQpIC/FLlbBcgS
	ZiQ8JcY9IXyFjEqNFO7uiP8e4/q+561D8FWB2C6xSPifbDVrhTfe1uk4zm5v+9Ea
	Q17yIQMoSgcfpPjEJlzL5Xr8JMkoz/0rir0KE6NdAuVXdFuvcAiuy07D6UpsFxqE
	AYjneMm382JNDfQuIkRx8vJNB355Tu8EkmBe/Oc1WzR39DGb5yRL+BuED416RUek
	/ouIuEOLFWiwHXLS0Ko1gOyp34m2aItPD5JU35mlVIu4SZBNAZGVo401vknqCtm/
	a/xagQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgstfdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:44:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabedcf97fso467127e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793018680; cv=none;
        d=google.com; s=arc-20260327;
        b=P2xIdOsDDm6L5g8jnRiu7kKppPSKM0KScrHQRK9sv/1h7PcYLJb8hk6WcB7uig3wF9
         7NmcSxeiokDGpu7GuERtYjbkQ+G24H0liC70b8uyPrBhNjA9hBkMtv4DGMZJqGVu+c6d
         Pcdtxb/v3u79J/98thg0kptikXbujH5VezdYYBAwoa7B0kcWaLA0ZK09pMqbuITaIBVc
         z+c/VPcRjnBT4r//lxFU84bvgxho6UbcRaDYH8KLnrosY6CYCeX7llPgs6NR6deaHFCs
         7Mdi2EHLSITYf600n/yE+lw98msxa+lGagtNZsLyLYnkFhTHJKz+n47z0T7X69FT0Lob
         I7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        fh=HBIcnocg1OGJCQta9opqc+usatE42IdOR6rZSTEO77o=;
        b=hARVcJO6eqJoM217Y2HYdYE3BkcsuCXTB8aHiQvEGJGoHV9wOJJRfzUIi59jE8wPuB
         pbvjjyWG8ElH9mFEymS7U2n89LDXoSFf1wTuu0AfDvkFge1lWV1DcXPBRdT6DmILQ0yH
         NsmSxCzyQsjCXWDLpbPTV0f+18ZLhCns2e/zfhg897b9uRS8IalUvkwwPaZw/6ce0Hig
         ogrA4GO5UVt4sax9t1VCG1DDdt8dXYJ24zfOvMwQJEgc+8QOuz/3CBjwUHYiBHBMqJ5D
         X1ptDpANkHPm09vCFOCDhsSykT+en2NifGsYI+13LM9ETqQXX+ViHc3MxEkwlX9H3SCc
         5qCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018680; x=1793623480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        b=NP85lmLhzodp3skdsw4qqH7atrNatpbJ94hZ2Wgw4OWFykzsv5hfHpuyabNNt0U6Ln
         H1w5xbZyxr9oq10Okv68X32AIRDnWYETW1b9JudVoSMjKWZgiZqM844RdlPo3fZJ/IL4
         jOm8kLcqaQU5wAWEjZNWhfnuUhm2qM7htVtbaX5E9VnagQqwZzkgvSIvT0M46kI1+PM4
         vbwZQm0WNmw5Y2oHbfOTKKj+MXNxiCSbxumNyal5gnqM8AjA7p5uFe5Vl2jWwIqZYnZW
         68X/xLabakWLP/Ocs4ZX7t3TgSguREeeQWo1CUvu9o7qOGDtg0ibndYa0B7NwSi+Av8a
         Kb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018680; x=1793623480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        b=CkHAuW7uswz8DeSxh0vqznfOwI3B0o1GyfkmCKM/KIBFCS5CRKtVmG6Ea3Bm9Kq+nM
         KLQlJiAv6gYfPcR4I3yq9EeUEOgX+jPY5byNWDkhjVePBAvJZUSCCpvhs4Ou5geA5YzQ
         EuR7U+4egwAk+1Bj5+nimBBJI1LzH2GZQvhld1kv93fEodJaYlgh8jO9Hp7WTiMV+dxy
         wi7PKBEULknAmfijFe7W1/QbZijBYQczl83Lv3Qo2CXm4VwAadchlkOgoypc8f/aLcVe
         T7+c7QW/UiDeq7H9otP/wlamrp+RabTSJ8En7RX3ZkoiqgWtPD5A+eVGINHgtqnjC+gb
         DKrw==
X-Forwarded-Encrypted: i=1; AKwUvByJSX3bgOF7/IF/zqgiG8a/HKMDAqFfU28Q+p2HMlrPDO1iCADGtu8y6BCqj7mk4/pv/kPZQ1Csa3gXOCRA@vger.kernel.org
X-Gm-Message-State: AFq9FYKtbJptvUi78aY0OL81vCRBDd6gscd5t+rEx/W1L4eTTSVCR5H9
	qxqgq3D+uNO1uj8bd+Xlfa6TzgkfyviJWzA/JWRXZzMJnhOIkD6rBss9KHuqgB72Yp9S6k4lG7G
	vHjiITgjOhQTShu6T5/Bsw9pB/nYlwROxOQZDZB67TqH+VntBCuK6t3wWzAvYzIr1cPfJ/E959D
	4ObXna0y0Xkqu+4GVID31f3/4l11bzwqjyXcJ4P10yqOE=
X-Gm-Gg: AYBFou3Osme/0ocQLQraAenvnm+N4nLVrnGefmAspA1IlR3MVG2/frd0uN0nnBXuZDE
	Q5WNAoIRddjgzthzeW6EbCazcIz2jb0y2v75uJuMSrOh1eiA2S6gwF72r8wBdrqXHuwv1+H6LKK
	bNLU0i6Z5hvawVMDvkFftvqJbULsJDigMVZm/3IcPwHre50bT4mviFY5skeQuXKJQ0n0POm1WKi
	LqCRUxqL3kuCWq8jA==
X-Received: by 2002:a05:6122:78c:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ec232ff8abmr2049988e0c.20.1793018680305;
        Mon, 26 Oct 2026 05:44:40 -0700 (PDT)
X-Received: by 2002:a05:6122:78c:b0:5ea:9218:eac1 with SMTP id
 71dfb90a1353d-5ec232ff8abmr2049976e0c.20.1793018679853; Mon, 26 Oct 2026
 05:44:39 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-3kJA+yct3GbWzs+NG=xFv_OGZj6OgToOnfcPkb9H=BuA@mail.gmail.com>
In-Reply-To: <CAFEp6-3kJA+yct3GbWzs+NG=xFv_OGZj6OgToOnfcPkb9H=BuA@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 20:44:28 +0800
X-Gm-Features: AclHuK_vZzSvUBbKv5qcRkDMeSvQ89XyxhHhnpT2JBNskNEMoXl_hPb8JdddQ0U
Message-ID: <CACbMrhoE2fcqGL-CSYPzacftuT=x+pVWAkkVvBXnkHuN+HzcBA@mail.gmail.com>
Subject: Re: [PATCH v22 08/14] media: qcom: camss: csid: Add support for CSID 1080
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfXycaUwJQmAur3
 D2ug8ExQDizvcGRLFV0PVKswg/oNlHmbBOj/CWPdzvLG0mYBlGfdtAsKebHi6SNzobkLam2CVb3
 fxWhRG1WcqaxBuEVKKBxlNdoqn4aXDI=
X-Proofpoint-GUID: froAUCgUJYgc5E4gbw56WK7cocqQj1cg
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf4b39 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yJPWxEu-MHjwpVTia4UA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: froAUCgUJYgc5E4gbw56WK7cocqQj1cg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX66ekjvXA3tx8
 8sI+Z0PAri/26zAvB8JNhpSv1DJ9ZcVnybRmt7QZfE5eyoxDwm59tOqpwcGYbhAklH1csHR2Bes
 d/hgU/YPK4SPdda05WhnYYTTmB3EIkp1YrWDj08eNh5y7rcqscc78ZZuqZc4osgECGgSKhdtgbQ
 zl+zv+V4OmNThs4qmx1BUcmCp5kwHiKtZXH3VcN4l+Ov68sMxodxN7mekzNjPlwggIYc/g9guXD
 S6Ve5CtEvb/rEMrrPfawJPywj4Kv/h7m1CMOt99MQlyastMmJw/Vk99YxHib5XZv2xx2V6jV6KW
 L2zFlxJAtJn4+jZL+0g2pxARmN5QKFqsdrHsjxn3wngKEMBzufFkKVIwZ6KDG6deYuCewbJLB3m
 DOIJb6q1ZfNwnRaYkc+skPEgytkD/O6WqLiLv7aKHpBrNy0iXFDOHTW0DmVNMKCpirUhJkFGHr6
 /FwKgi2C1NWEEdPxxmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260050

On 10/26/2026 6:49 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add support for the CSID 1080 hardware found on the Kaanapali SoC.
>>
[...]>> +static void csid_configure_stream(struct csid_device *csid, u8
enable)
>> +{
>> +       u8 i, k;
>> +
>> +       __csid_configure_rx(csid, &csid->phy);
>> +
>> +       for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>> +               if (csid->phy.en_vc & BIT(i)) {
>> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
>> +                       __csid_configure_rx_vc(csid, 0);
>> +
>> +                       for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
>> +                               __csid_addr_update(csid, i);
>
> Do we really need to trigger the same AUP several times (one per
> buffer in the FIFO)? could we have a small comment on why?
> Isn't this already done from the vfe_enable_output helper?
>
Yes, this is required. In v2 we hit an AUP-related issue where one
buffer was missed and capture got stuck on the last frame of the stream.
Vijay explained the details in this thread:

<https://lore.kernel.org/all/662a21a3-de8b-406f-a15d-b8a572aa79ab@oss.qualc=
omm.com/>

In short, since the split design was introduced on the 980 platform, the
CSID has to be configured after the VFE. Otherwise, rup_done or buf_done
IRQs can be missed. Also, each buffer queued in the FIFO needs its own
AUP. If only one AUP is triggered, the last buffer is never processed,
and the pipeline stalls waiting for a buf_done that never arrives.

That is the underlying story of the 04/14 patch and explains why it is
introduced to handle the platform hardware differences. Thanks.

<https://lore.kernel.org/all/20261024-kaanapali-camss-v22-4-7da3ea49c8a1@os=
s.qualcomm.com/>

[...]
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/me=
dia/platform/qcom/camss/camss-csid.h
>> index 2f7e593defed..603621c16315 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -162,7 +162,13 @@ struct csid_device {
>>          void __iomem *base;
>>          u32 irq;
>>          char irq_name[30];
>> -       u32 reg_update;
>> +       union {
>> +               u32 reg_update;
>> +               struct {
>> +                       u32 rup_update;
>> +                       u32 aup_update;
>
> I would say keep it simple and just add addr_update field after reg_updat=
e.
>
>
Ack. Thanks.

---
Best Regards,
Hangxiang
