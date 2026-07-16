Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFF8431A2D
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212895; cv=pass; b=UeQXUeQiqjS5UDB2NxjWohDnYrTnuqsYqMRWtsAg/QPP7EI2qKXQQxRtk5kALiBXl/Pi+0m8uS749+/BTo98JtHfhxdDapZH8UTx7XtE605nyq4vIHMYCaxto1kcko85zfdG+Q9qPJthyLmYKIjoTVjgM05LwHMvzFTVFEPl4/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212895; c=relaxed/simple;
	bh=hyj3UnvN1eL7blZIruI+pgZz/uFUOhtMU/v3/gNCvNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OkU8bH1A2+4NlhREp77J4Opg9y5eDuS3FZ3SelFGlp11Nm2hNuicPIQx4M31p0NMtkR07KYN5E99XzwrhJaoOWLnaZuDQpX8A8eyZHSPosWkcHoq4y+eOnG0cIJWsU+UpBvZ2S3fvEAMcoLqF++i9yPkopcXUXyaRoAlbcJgaY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fq32eMEn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wmm9WxTd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fq32eMEn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wmm9WxTd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJkCx2721625
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUqxKURSoOVb/5L3BwAiJscutjj+pBqwPiIBk2WAZMY=; b=fq32eMEnkSDXCyNI
	O+OEn+jRvMsMTtmNa8m8gqiLuPqA2oGtOQ7mvg4N+hT3NzUjClAuV6CScNuA0TdU
	9GlVijnYeCmS/lYORwfduWOa0mCSQ+XTxd/KZlJ8EhYxOkHk6phRqtYkMugLqSw9
	LPoSTjBDF7DYXdaOBt0fVBPki4cWKimQd3lNASYCEUJMmPcX1dmXxHTBL3kvRqRz
	DNlTd2tZzOkZbFCDvgIIP/2gbXc0oRYzq50cXSc1YrpWpOcmTFyfH1eZGNskfRxV
	8i8Jt7O1K68TUzD3qb/YC2zQSc+00matnHCWmrWfkio3K8+oRzkTlrx3cBJalygz
	NfxUlg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvcd8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:41:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92d1cae5740so444070185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784212893; cv=none;
        d=google.com; s=arc-20260327;
        b=jamUwSuykRfqPYc+tlrAPb2nNLzESJWNkQW7p6sKqL/HZ3KpPqMC0px9plMU9HRJUd
         jwbfLmqESrvIiwX2iPnD7xfpfF9wMVQ9zwcvMQavgNm6mqvn3rVdrlyjdYwkS95Laap7
         GqfnnK4fsehLoEm6fYc7k6WTZV73LFEtKus9jfrkFyHYe9xkQcYyXwfRLbQVrgN1AM20
         A+DEcdxVtcTzCcfDiyqnqMoIS6RNg2mqIG6R5rs+6vQTkQM6pF1PRFV0ne8riQqw2oFM
         vswjIaWO6nONEGAO0c6m8urpyupaGjCTAThyj8XcfCIlar2+iVQVu5lHkmazN5fBrG77
         Tmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uUqxKURSoOVb/5L3BwAiJscutjj+pBqwPiIBk2WAZMY=;
        fh=nfoQ0hhpR3gP7CyTU1LYQZmtPFQ9MQf7OfSLq42dwok=;
        b=kP/oqOgvwcnCrAAVbqtvQHOFsFnZygr+pycsARUmXw6L1tAF+xE1qJJdKjeEVmVopw
         B1qi/uKIj7Swv1gLQOcMrwbgBbhM46DLV6myjefsNjDYbE0hPkW705RA+dTpCZlBameG
         662nAMB0fgBCzIaiOVJHWgrOutlHNPufe6R8ktLCVDQTUXH4pVw/dgsVfsfK+j2ACw10
         NKu7zvf0VWm895on0ykLL6ZvR5PtuUV9VP91zkjMTUVJL6pIW+JpB/m3XguiUwk9Snxh
         6VbFu38ntX+UuN+gykks41CSz1sV926rjm3/fH37tLOlnUIi9Os1orVBMmzrsRw6woEw
         jYMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212893; x=1784817693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uUqxKURSoOVb/5L3BwAiJscutjj+pBqwPiIBk2WAZMY=;
        b=Wmm9WxTd8EUWtvr9KorvXD8wLWoCKYO9rNJTzlbdqec0HlUIF/9ESodj86I4hapIaL
         LFepfgInSYfl+u4JLXVnt2Lf6K3y5TB4PbFdV5ES0Cq7eYmPk4VoCIXZ5nt4fkfvGpHf
         Wi+6HpC0hFDzz2BUTte3h8SatKbHfITuUNOF6pzvhEujIMLRvqJrtaxW2H3zuJx6wMUf
         hWe9IjyzbBEu3aNM6aaqDtX9foQvWOxXvbsVPYPL0w5n2xp0f2ISQijkWtN4V1ae5x9O
         O1W+HADEVks7SY3gjOioq6g+jpLbVyRAQtWYEHu230Hkj22/heWUYp+vcH7BnHDjFTF8
         i8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212893; x=1784817693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUqxKURSoOVb/5L3BwAiJscutjj+pBqwPiIBk2WAZMY=;
        b=dsbisrowr5zgZJvYg5doQlevPA3/j2xYQ9suYlT75EPegZVC25mH5SnKuKyujBTUIS
         dgxD99vJJGOKxU4rG3XibQmGM+y7lCquVBlNwD+awnV9n5UOqsJkUZXld71xdNAcbfwb
         1BXom7BSVnWT5dWVko6SNR0Fo1WCIbEu6AgjKGbHsATWd/3/M4uMyZgZWTS27pkxLfa0
         bXWV2dW8o1Qk5rGC/8yTxjylWZOQqbPR1L4ucvYfPfSTgXuROONSw7wk8jvQF+7B6AzZ
         fSPZXiclvWO4zVi6xJhwAp0osDK4V5/Hq2CV/3CgRNfLW2IweY2nSHHUzwZX0s7VbQy0
         Lyww==
X-Forwarded-Encrypted: i=1; AHgh+Romzib3NZILTgQ4SGx3Z9f2lKAmanal05olRHHdY0yw8jyGLB3Cy44txooou4ToOTF6enhVpB6EG53LgmFW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8/joFYbptdQ+HoXnt15eSZQiyQbk+iPzxyftI130EMRnejnf0
	qUQZ/uxocXn8ntzjLFJYa7MhCwV3l0W+vXwL6twu+J6PG1gO9gH+LHby8zgd7b4lOuUBLLOktLV
	V4QLB9QYt6vEXbKqmwwebxPrcLWzZeYB8jtdkRKBfiPoakWbyGRuJW9aGpn4LhRbhNrtOlyJ2bC
	XqNADmQkHEkF+0PA3VuakGTSGT3r6JhuiZ/vWgux+J4BnRlieeoAsbmg==
X-Gm-Gg: AfdE7ckr6ABN14u7akZFvcTzVo2yBdzisfQLM8xSh0O9j8PTo/prN948/V2LTcjTihj
	C7ngrsJgj/tN2m8acZfMrCVJ/tXLF+6Q1fAhX6dH0rkVeWsIZc9RfBVjvhzi1ziEBcVSl1xX42N
	hgzT54pSNVIICIuooWEh6BTOR1nXV2728L7LeDYNBH8eGEqz/rpHwi3ZM02oNJo5KC5d3gPvnT4
	JoaKMUiV9iHHAjnS3NKTmv2ONhmwDLWRIiH/KjT8eqfsxvfNycLEQzsXvFJg9lUb+nwaLjWK2oX
X-Received: by 2002:a05:620a:254f:b0:92e:7733:e398 with SMTP id af79cd13be357-92ef2c61899mr2368570485a.41.1784212892786;
        Thu, 16 Jul 2026 07:41:32 -0700 (PDT)
X-Received: by 2002:a05:620a:254f:b0:92e:7733:e398 with SMTP id
 af79cd13be357-92ef2c61899mr2368564085a.41.1784212892247; Thu, 16 Jul 2026
 07:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
 <20260710-monza-wireless-v3-9-46253587af64@oss.qualcomm.com> <6txwszoqlx5msqhspafk2t66hpdf67tfvc6qejeave3gg4fuby@rosphqguupiz>
In-Reply-To: <6txwszoqlx5msqhspafk2t66hpdf67tfvc6qejeave3gg4fuby@rosphqguupiz>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:41:20 +0200
X-Gm-Features: AUfX_myENjJrfTQJZMSC_KpPtznIhruyFgPIX7MpMY0JW25MDOTnZMlXQyQrAw4
Message-ID: <CAFEp6-07-6wzV7c-8mLDCkfVhgwVQ59BdTGvaXovu5PUGBCDZg@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] dt-bindings: connector: pcie-m2-e: Add vendor
 LGA connector compatible
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58ed9d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Kcl6yQRxnNA2GZFW2kQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1MCBTYWx0ZWRfXw2cFWnroNqRA
 UNKQOjzeHX/9P3iFe3PZd4LMDgRkScDwj3zW46XHBw27iyRYnCfr1EvBQZE5ECWKbH8uldRzc7H
 ohVf4UWVxjivqNrZ8fvwn+NSEqFfKq4P5XJY1e54wfzazYmKVbTi2EsstyiyzprqXdI9PbWo8lT
 pxGWLR65p9/tMxT3nGD+Gwri3od5NvwsYtGb64d/Zq6QKKZk98w5u0P4qyweh572YOjCIE15hPp
 aa0rdVS4j2lZbYB+0wop6+CaX5X7gCywaoXAZJeue9+Wm6+VwBKJ7N3T9glcmeMui0xehdNobpS
 T4Slb57HoVW4DFxXoZBJ7XOfKT6hwzHaQrGXoTTqcGWLHEPj7jfWXYnEoyDSeUwOHh1dMCdY5R7
 Y+t5EO7GoBzeS5VYHnsdC5IfhCCpSzS2BaSMGwf3ni5X4lGYdJitWWVyQm1RGIoCR1JsYF1XAyj
 uGMPIJGZy/DiKHKWtuA==
X-Proofpoint-GUID: CwN1vSsNR9x08j5kFE22TxverTJZapFH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1MCBTYWx0ZWRfX+w3NBIWMgeJS
 d4PGtmXPNQ7sbnUJl8xqpI5E8tF7aKhAc2v5GRObrE1m5zEbX1ZbKktZ6HR2amY3MgBXX9N/20C
 VBe1MA4R2Y3HKOzlgeCnX/1FupOoOeQ=
X-Proofpoint-ORIG-GUID: CwN1vSsNR9x08j5kFE22TxverTJZapFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160150

On Thu, Jul 16, 2026 at 4:30=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Fri, Jul 10, 2026 at 11:57:35AM +0200, Loic Poulain wrote:
> > Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
> > Key E interface signals but are physically soldered as an LGA package
> > rather than plugged into a real M.2 Key E connector socket. Such design=
s
> > are not actual M.2 Key E connectors, so describe them with a dedicated
> > vendor-specific compatible while keeping "pcie-m2-e-connector" as a
> > fallback for the shared signal semantics.
> >
> > Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 module.
> >
>
> Could you please also add "qcom,pcie-m2-1620-lga-connector"? It is
> functionally compatible with the Key E connector. Otherwise, I have to wa=
it for
> this series to get merged and send one more patch to add this compatible =
:)

Sure.

>
> - Mani
>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/connector/pcie-m2-e-connector.yaml         | 7=
 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-conn=
ector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connecto=
r.yaml
> > index f7859aa9b63469cb43919c0b5719c18694c5364d..0282c6ee9272446064a99ec=
6314a5ceb1721e0c4 100644
> > --- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.y=
aml
> > +++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.y=
aml
> > @@ -17,7 +17,12 @@ description:
> >
> >  properties:
> >    compatible:
> > -    const: pcie-m2-e-connector
> > +    oneOf:
> > +      - const: pcie-m2-e-connector
> > +      - items:
> > +          - enum:
> > +              - qcom,pcie-m2-1418-lga-connector
> > +          - const: pcie-m2-e-connector
> >
> >    vpcie3v3-supply:
> >      description: A phandle to the regulator for 3.3v supply.
> >
> > --
> > 2.34.1
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
