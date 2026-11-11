Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381021;
	b=pzGSTmJiiLRpqEm/cQaMYgmC/gT27niOjJ/wwELTJthWTIM7hFrr9iWg6GY2BuifElu2
	 4HpaHF1/dRyqovJES8c2yg3QvHnJZzEm03awgnxE4Bd4sb2e+44TzR4juuoOi8gd4E7Ex
	 PfTNH2y9dHGnFAo/k2nBSsXGFIKXmocf8o8lmV+w+ruZSu6HEJxe39qy2W4nL0jnFdiv+
	 r7ibal6g5fS7wCvnW+5MH8eorEJXZ8bA8Bz0DsIPxRsuKdPER95GUcVY1j8nz+y+xIq7I
	 oVpOEeYag10jfxRy2STSeuxUi/9cc2ZyqnuTnEny0dApg9gZJKitpAhy0pXnalVRWUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
	b=JCvyijuM9j7CIla+pAoruV2SPkMeVf6omsamDXQLvbrVP4ry1KYx3ZLFA141fMnCzSdg
	 s90oQaukQnyff3xAYLsctVftJyMVO4D1aGzzn+ykazAiA/nLxxfnKHPbbnqXii85QVHNQ
	 ieEL1+6xFJxLF21+2yla4LfWClBufEEBIYk4cUmy2mIkTGorD0KH5ShVztUOscMgm/IUl
	 3OrRRdBOG7mXAaeVQHjZ49DetGnR3tK0WH9HF634+drGMitrUDhNBQIsTQG6xATKbueNo
	 UDhq0A88r8oBIkd4IQs+vN3aCB1LTkTWb3XjJONJX26dt1DgG9qhANz7oQen2+nCkhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFND5jF5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUGMh8QU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A56606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A56606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFND5jF5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUGMh8QU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KIvm1369022
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=; b=oFND5jF5muk5SSG6
	x9JOIMx9x232dA6O2ATNkn6sWV0UodJv1+B2e7BRi/puHKK8AUR3TCKzZSGtSHU8
	9svUKvzTsi+LNIBpG9WUmauSZVAz3i+BsmJrYHCyEeM/hFW/FH6qgJ3hgeWL35Yv
	uEftjHP0oJPJe+MDww6tHw6iOIcKMTigexvq2AeX4u1fK6vZzGdfnQcYXYTePa2I
	4Q0VtRd+Bvs+LivjFQxX5QASU/L4lovBjKv13Z4D++PI7GQCuH3Ajy6p4jxbeOD8
	i8JlOF6Y5oHK1md08FgF+fpfAeasxFiVwtIyzC3O9rDt6zLdXM/3HCe5kkA7ymTg
	ak0HgQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpehgkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:10:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1677011eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794381019; x=1794985819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
        b=OUGMh8QU92igMJN+j6348pMjzbKZEJVdC1bAUubEBZAaSb/CcM9ImEil2aOFdxnlnP
         Mruida4AgLaKfJy80n5i+lPlZoGwJrT4tid8ipjhuoQ2BN5q2Xs0fnsLSLoArTBPQ7HG
         r9W4f2HoBgmDkeb4w/v6Xd2hWmIKnP+YnurR5pM8QzPzzQZV+UdW9JmlssXUt+I3r/9k
         +ZhaZ8J1sgS5INCO6wi/pByCibkWrOZ+kvzrCzkJNrf+kbZMv8p6OZ8Uktr6Hul3AN9X
         ser7Ww0tpi/V5wfOSohrPGFxAaj1jO09DCN+FH+/dgHLYOElsiKimEgkGDfwvQRpCa9o
         HdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381019; x=1794985819;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
        b=w/y35PCtOYoC3mJ8STFziMB5g9Ros8a7FLOZO8hYQVTkYPwduLqbVwy1+x7oB2FLA8
         xPEk7Tx+yJzECaOSDNjN3AO3J6EDAE1SdWE0QMnt/McsirVmBHWlYO9zT5OZYOTq5NCf
         5x+e0MZvL8klyYHVH+FssJx6rw7TE7TQGYuhDNk21MEqlAkqwK42JLf9L0vpxIQif9uw
         iovvosJkGKwzegLwB3S0zEWvQjCyNQfj5e//B6YSb0w8GfY/Eh7AUHHLWREL+FHmpXXu
         R9Uy/wF3rqzJONp5RADXv0DFTYR5sRlcnKHfibvC/4ozpYKvhNCiWdYL5BGOY3WfSQou
         RrMA==
X-Forwarded-Encrypted: i=1; AL+hErH9DbEYU2N0gMdXgdL8ZcoJ0m/vwxwpwjgjzdvaikEwnHnDvrbUScF12GC7Pkylc+hvwVevgxEzTNPGbXRt@vger.kernel.org
X-Gm-Message-State: APuU4Z9QBfwZ+M+RLB9mtEUD2h90QT9V9kCiGJFLkVratyukOU042Mzu
	4y+USCL4vnmBXEj0zLOWM9MJ8As1vTf2RUaaevWWKnjKIwhrdLgCAA1xVRMPUPVSbYW69V2GRat
	7s15LxQ7DOuKinpBjf3Y1xugxc141c6gbCnbE5PP1SEos2FNxD3p0GqL7Id4ml2JEKdxI
X-Gm-Gg: AYBFou1KPb4EUv9OEMNMNJ1YOjh+57SUeZFUiCdOlw8dYHpt188OqzBS1+I5+zeOZ2B
	V+11IY+JUODK8iDsQqmoTe5OpuaS8L2XTVFCC/tpv8V6KRINzJnQIBjLvdnvKUJ7tSExL9RuXn2
	73BJYz+QIZVkN5P/2xAb5GwsivRwZZ+SKYHINF4mdgvGcaStBSYaLkV8q90+yY67Y9NdbalAG+i
	WLwshNb3qFDBg8z9vqeGGBT3Nz9YglxJs9qqsbZx+14kzPETVEyHxF00xhn7LM3e1XBt1Ff7jtX
	0YVQTYXHil44E3GI+Ho0h6uDGgsZGb942cI8lh6OOoaFNj1KZfYEcWgqCpjPk5JZeVaLgjL5n2U
	7w9xDW+6ZIXHXPvwYkjAySyTG20mc9bDazrlMmSRcG5lg9KQxgf9uDyca/N6awsCcs7bt3V/FbQ
	6RA+EC4no=
X-Received: by 2002:a05:693c:62c3:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-37687119518mr1917662eec.38.1794381018893;
        Tue, 10 Nov 2026 23:10:18 -0800 (PST)
X-Received: by 2002:a05:693c:62c3:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-37687119518mr1917632eec.38.1794381018145;
        Tue, 10 Nov 2026 23:10:18 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm12686718eec.11.2026.11.10.23.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 23:10:17 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <2fb9fd90-fac5-4a9e-ac7e-5dde689d8b80@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:40:05 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: iommu@lists.linux.dev, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Simona Vetter <simona@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        linaro-mm-sig@lists.linaro.org, virtualization@lists.linux.dev,
        Jason Wang <jasowangio@gmail.com>, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-media@vger.kernel.org,
        Mahadevan P <mahap@oss.qualcomm.com>, freedreno@lists.freedesktop.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Will Deacon <will@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Philipp Stanner <phasta@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <179304379330.2965544.11793708430519844335.robh@kernel.org>
Content-Language: en-US
In-Reply-To: <179304379330.2965544.11793708430519844335.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfXxvZcKkDzSQBK
 pr32jpM+KCqR5QlnDYLVHgoBAaQoWXiLJlCN1m+w/gkMKJ60PV1yFKbiXN0LGmMyuNZcSG4pb+f
 9iSYCuePVft2/gliUZNS1ozr624omtLuJ0Ny6yZR3VAQ6yKUw6rve6LkNzRU88Ah6xPNkF0N5bO
 Bw950WToOoAp4qLUOHQAGwtaFz89mUW3KxlJ+zFih1a7sReURVBOYXsJk7jhyE+R+4whc3U0usa
 ozeBypNjFsFQ5bl44mYdIAUkro1Wxr15RvOsVSXxevtnM+7ALmDq7b6BtM1+AyvGNHWpq3iimLB
 Bz50P7eFT4L8OQL9gY5pxx2vHKqtA18QPglsZSEHglq4Fm2DoUpgOf7gsUZXQR50CRi8riY96cD
 +8+hqNqMXF/td/lweF+/cjMnAwq1t6Mr45hCc+35intunD7t6RQjasKP/hfZsg27stH5xPIx4tY
 p7WdE34Eb3bFW3tIeYw==
X-Proofpoint-ORIG-GUID: thCr0wtvo8UvqAc_UGKBAZ_jnHKF7k97
X-Proofpoint-GUID: thCr0wtvo8UvqAc_UGKBAZ_jnHKF7k97
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af414dc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9TjDuG0S92mpM2z4UZQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX0J+U9FHsJYv0
 CQ5kc7Q8qmvYFTrOzt14O4x6Qh8BoI+YKmuizvNty0UeIrwIwuFpcCLAKd0a4/Qk6I9xcubRUqz
 ANmqiKrFWC3wLFy0IzI0MbLDMKvKHuQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110028


On 27-10-2026 01:14, Rob Herring (Arm) wrote:
> On Mon, 26 Oct 2026 11:51:11 +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the Qualcomm transport
>> wrapper, display topology, IOMMU contexts, and panel connections.
>>
>> Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
>> subsystem. Document the IPCC power-notify resources, transport and
>> framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
>> DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
>> after the IPCC power-notify sequence has completed.
>>
>> Assisted-by: LLM
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
>>   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
>>   .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
>>   3 files changed, 334 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml: iommu-ranges: multiple incompatible types: uint32-array
> /usr/local/lib/python3.13/dist-packages/dtschema/schemas/iommu/iommu.yaml: iommu-ranges: multiple incompatible types: uint32-matrix
> Could not decode node virtio@9be8000 property iommu-ranges with value b'\x00\x00\x00\x00\x84\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00'
>
> Traceback (most recent call last):
>    File "/usr/local/bin/dt-validate", line 8, in <module>
>      sys.exit(main())
>               ~~~~^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 443, in main
>      dtb_diagnostics = sg.check_dtb(filename)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 331, in check_dtb
>      dt = self.validator.decode_dtb(f.read(), decode_errors)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 631, in decode_dtb
>      return [dtschema.dtb.fdt_unflatten(self, dtb)]
>              ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 591, in fdt_unflatten
>      dt = fdt_scan_node(validator, fdt, '/', offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 320, in fdt_scan_node
>      node = fdt_scan_node(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 320, in fdt_scan_node
>      node = fdt_scan_node(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 312, in fdt_scan_node
>      node_dict = node_props(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 258, in node_props
>      props_dict[p.name] = prop_value(validator, nodename, p)
>                           ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 185, in prop_value
>      if len(p) / type_format[fmt].size >= min_dim:
>                  ~~~~~~~~~~~^^^^^
> KeyError: 'uint32-array'
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.


There is a dependent patch which adds iommu-ranges, I had tried with 
that locally and it passes.


