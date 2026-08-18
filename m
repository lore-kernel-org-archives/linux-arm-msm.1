Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045724519A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066935; cv=pass; b=o4BprnTtPulz79cC0agtiqFs/3g6Z95Js+zLOkdvwuPOThBf9YtlDmbEbukVLEo70QRVCL4ATfS6JFpPZi7508rqD2OVYq4DAZOaWTTBRBScStVdHaXHrR+Fl3iOl32azr1345N9NsalG7YESEcGZpfxs7hCA0z7NL5zZT8N2/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066935; c=relaxed/simple;
	bh=DTy3+B67pxgfZhDy+SiYueZB7C8wJDeOQgcoeulvcdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfGTQv2M/6r4dCmkRoDXFvSnV+EMSdPOKGQj2CnzWt4Ohn0Gx136p9ioBIiOxb55pUdWFYc4ATIfDRAWVqvfge7Ms4glBut2/+X2W5VvWEKdyJB2arCiEhZi83a3KWQU1/Q1hxm85F6B5bhNlHIBHNcA7I7Rb0kYXBK+y6r8+og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKzMcLlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvlOQhBA; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKzMcLlC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvlOQhBA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0dgj1502675
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTy3+B67pxgfZhDy+SiYueZB7C8wJDeOQgcoeulvcdQ=; b=aKzMcLlCdRD7dRxJ
	B7JYiWfZEP9+yGeXaZk323F8L1UVnfiLafDcCfjQgsTZBQ4981CSJQTUnVssJk2Y
	7MEKkICz30NzNAs24HzSo1ZcJznyER5ugj4hxt2TwbS3MpmPeWKdPurmijus9I+J
	jVd8eWyaKuEL3K402BkLN5d199PbTKFUYvUWRh/0y9awq31xM24aWslBJTw1rkUi
	yFNn2jLtbpD+HDwFYmXKvP1Mwx3ttH97cEpLRfdGaRUyp1iVGWbidUFsd0H6dJYK
	QcJgLF0EllOoFbDCc60r+5ZtXS82y9dtdWhFZ8Eo+XropBizXMA935mrq0JlwDqh
	o3qKTg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4prn13ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:28:53 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-837447b271fso26278567b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787066932; cv=none;
        d=google.com; s=arc-20260327;
        b=kXHDN6xF60evSWUj03WUspnWtYCTAiNd/pc+oxA3hdoFTy5o3lnd2OrglRitRkVngC
         N/1L8SXQ1QLcAf91J9yMO9vmY8tfxRHjFZ8gJ4y6NCU2UidoOiVeQpT8iaQA9HIv153u
         ndcJmxGru0hlqJuaqt5sy68XqyNdHMoNy7klyIBlkA1wugZkDhnS+9GclVMh2B9e+/HZ
         PTejHYbDLRcTMotsf07cW57bu46/w7UmuyK0b4LG8xERO9GkXdOqNU70uBgp6zt+OG1Y
         5vh6XeJdzkpuGN+ltmWUIztBwwUpnB0AmCyXGZVP2aUwnYUwoBBiICgoHA5pdHk391gx
         lu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DTy3+B67pxgfZhDy+SiYueZB7C8wJDeOQgcoeulvcdQ=;
        fh=YpgzcFjnxcm8dYcZdVODGCXOQAHJSs3kSHlYE3Qnb3o=;
        b=XAnbsyfQ/eUKZCfG+51JSMGOJBZOFurWwL8RaQswd6zqb9pskyHjKB/Ge2Rblj04bO
         LeLr3upFtcZvcigZFAWHjJ6s6DAO3ciFNgsdk/0IP2W9AwtbGfJhxDDj6gBIeXdx9jLA
         DKgWiQDJ4l/gtyeizZed2zNzr15D2LH9noukYCoxb8xq9y1gIvFdS+f6CCEtg0PZ5OkW
         pdbFat+zjBE4d8C9Ek3YmOKRjbUCkfrUNQoJ5MvI4iftLn8XUZsLE/D3PtwbWyRFXT3u
         RRQBuutttgxiEvorczndLHQKDepdbiYDPtfdAoq53J87pj6UkExbWwg44SIO5sHrcHoz
         zQcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787066932; x=1787671732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTy3+B67pxgfZhDy+SiYueZB7C8wJDeOQgcoeulvcdQ=;
        b=NvlOQhBAe8m6cQmQDXoedgRJrLuVAmjY/v6hb0nRTZVF+7R7RSQuvbKgX3Hj2g+Ubm
         DdAMO7O1NJqP2xdEvhFNm6QKQ8u+MCKqZYf7iVRRpOy1ZnYKgKpqplicrLTJn9QvKFjL
         wUxWwaIA2+ZG4fCj9JjcMJJfm7axkHohOrSZ4Hquk/BywxFUrQVEzwPafIrgyKFfeNkC
         O3B8ElxQ3P9FypBpAo0wGSTAYma56BDgfQmugb2NeCoMCoYUgjrOY3nuFdiINNbtw/ya
         qmBJjAPYc/i4bLnRoCXj1bJWPNmz+VDOQF6huCfXEdzYfWjCB8eQJgXw7DJmQDSp+E6T
         XJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066932; x=1787671732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTy3+B67pxgfZhDy+SiYueZB7C8wJDeOQgcoeulvcdQ=;
        b=qaUj7h4j2yDwORCF5GvSjb2YUcnOPIQ052l4aQB2d06Hpg50/ZUIPDnBOo6nwmQOdc
         sAVtK23BGljbZHj90DOU+esS1BajmBdQlJ4xcRCwz+Csq4W/DU4LUuSzXeYiXyvPJQRD
         2KrJAQgVQiJX/fcMZFbMd1eonDa0iH7N+5Rm3jdNXIhBAjX3V/pt33dMRIWunTT/2QpO
         IS7JYxtE64Aae6Ns2WwL4yQpd2zGajGPcxoibOvVMwsZedaE0zY/yK1q1HUfyl9NHCzF
         1TL4rOAy6i/KoQR6kkbl1aGzN8nAGYONOkcKrmLhsroKhHv+iAOQrLW9bi2bo66B40CP
         spMg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1ideWet43/PgEP4yHcTN3Eh8F386y856Pmb3H4nv9fjjikOKvOmgnSoUuzTVpxIolR2nJCsi2cZtBs7Yl@vger.kernel.org
X-Gm-Message-State: AOJu0YyBDRvEML6tokKJwihifwjfcKfYhEKjHewlxPyY1iy+h7t7BHSz
	jPdsbyMyW94O1mGYW1t4JDvFY8E5zFPMeKWrYcznnLHXVFlmqdcyYp6ONO6Cuzc7TZBl/9VF4gk
	u5AxPu4W8NfjwaNqik6PWtmskZyLnZ5Cm+2wl9saD3ESpG+VH0vACm/tQaeVCd5KD2AblZy33gt
	Q+u93l4zoiwnWJct0aZ9toIKpmBvB04mkzkM5E7l+E2bE=
X-Gm-Gg: AR+sD10/rAJQsucZguOVk0tJIr9WSIBnttAxolkUBgGi4aow+zket5eoUizQzE0xBwd
	nmuQOpozEju/ku9UDjKRDWpwAo6v28FMdXnxiDFASGJBgk640D4umt36eEU7BzknSS5iv4Lb5OS
	agKJoTfHF9YnqsmvvpNMl3YcZTL1OPoWLdbfKwNYixqZxEJrFwfHyPYw==
X-Received: by 2002:a05:690e:155a:20b0:666:c4c5:7525 with SMTP id 956f58d0204a3-66cbc3d8adamr2153903d50.24.1787066932153;
        Tue, 18 Aug 2026 08:28:52 -0700 (PDT)
X-Received: by 2002:a05:690e:155a:20b0:666:c4c5:7525 with SMTP id
 956f58d0204a3-66cbc3d8adamr2153876d50.24.1787066931719; Tue, 18 Aug 2026
 08:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814152610.2039318-1-milosz.wasilewski@oss.qualcomm.com> <2deee675-e82b-4822-a43d-4264ca8cd512@oss.qualcomm.com>
In-Reply-To: <2deee675-e82b-4822-a43d-4264ca8cd512@oss.qualcomm.com>
From: Milosz Wasilewski <milosz.wasilewski@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:28:41 -0400
X-Gm-Features: AcwNN1Vn7wdwA-Y_UWlqdj-gRIvhsjaNGKlX7k8kMwe3TvS3UDX7acOhRTSki68
Message-ID: <CAEGFhMpTrgmUYfLSKCAvNRXgawbppuHnJ+PMeMx5M4jzm9_tKw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco: add PMIC PON with power key
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNCBTYWx0ZWRfXxOPBzJIRUiJc
 TuVpFhju2I1v3i6pbJ4/7LLAecPOtAakF87Fz3k8QC5w+rxUXAlBuHGcW7ieqGLHBOUt7MoiBFV
 pOvk+79nqxOtdrN7pQNPRxzo17n60eg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNCBTYWx0ZWRfX1vsloTuoPTVY
 E5irx9F0e8wbYzFASBRNhVtQow3a0lH1zs+xHh6qHhbkX9gF5aXxZCJM3/RtdedmB1cRF0M780D
 s/0Sfi+AmkLIPxjXphBY/M2kBxd3T9Wrd3a7K0wftYngySxkkbUz+bkzl+FY5Tu1By275bB/KK0
 DKkVNTGyui/22dIoGWPKznfiWGgMnIST9V4mlDy2LCDR1QiRbVKb6ceiL68oI/afPJ2DJmYoj78
 V4SaPt0Aj4F14EU2ZWjGrW1ZoXN5KAsHbMSn2coljYS0D/hoRH1beow+dhrD7RcnmC+z03Us5D4
 a8goSUuzEcj0tWPbJZJPSz7taK3muGCMEyd46kL5PPWpgRhvk4q0/PKFkVW05m+YB+NmTdH7cxM
 ljjxOQ2jSxLbqPNNoyLGYm0KkZnJR/FrIVIsFC5lZjJKXMeizujvWIccrGoefm0WOavzeM4jGBq
 fEttBQGRXLhewBLCUiQ==
X-Proofpoint-ORIG-GUID: S1pcKvZmwaB0T9mrlivjrV5ki2VVFXEU
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=6a847a35 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uUlyFbyf3nrlIwLYtmQA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: S1pcKvZmwaB0T9mrlivjrV5ki2VVFXEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180114

On Tue, Aug 18, 2026 at 9:02=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
> There's a parallel effort:
>
> https://lore.kernel.org/linux-arm-msm/20260724-b4-add_pwrkey_and_resin-v6=
-0-41acc214d93a@oss.qualcomm.com/
>

Thanks for pointing this out. I tested it and it works.

Best Regards,
Milosz
