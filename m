Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700CF3DA5B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 21:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786742794; cv=pass; b=M/+uJhOt6D8b1OvaKYXj8VyiAzrzwv0jVmShIIyl26q6451VfWQb/Ke+AMo3/JXbPAocAh18x7tuE+mEtVA2NmpsaqKT8/N+Y8Xb9oo8wGELLhoi1PgbJUeu0FgybNbI5aXr+qlW46qvaaFmPetU4ZOEnAyZcMnYjaW+PQ0yiH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786742794; c=relaxed/simple;
	bh=efZDmkuLFn1Cbw9sRwxJrNeeGhr8tE11Fl9ih11gG4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zw6WoMYZVD2GK1jrKIZjUOqmBRelrcWrgVM4Z4ldex30NKrb5aXRFQSiFTRCnEpuqf3bkdBrGz0EsrwLdbePI62CC/7Tm2uPuqr+Xpn/cv75hNbIQgKOL81mysFrYjWDdXMFR/T1Xw4cRjDMP1vWT7K+A4YJWcofkZPlng4UFFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pKgfmc/t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhm3Gc4/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKgfmc/t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhm3Gc4/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EJh4D13739877
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 21:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zej0hJ3ojhA2wz5U7Y5qrHzGRc5LlV8oVkIjnWu4V6g=; b=pKgfmc/tKSpT8w+L
	l86Yqk1Zw8bhfgVcynhkMfR5RLSadImcTLvaayco5sN5gSKKZOhbJ/vuGmKlF+Xh
	vwoNfVn/i9ddEmPbxz5rJ1KXK1RXcRF/blVWRFFyRIG2O9YcXZrsUH0sBU0LgEyX
	YedsIq0rc8UtiFEl13A6XHqIokMaBQBgPQbDRMF4c3QxxPHhztDlC/5YSunapwpz
	ZX3MpTARqSukVv1whwXDgKSywcxu9l6lsK0lhHZVrD7kZ5d3IOXTyzAQymdmg9a3
	QREeE+2uafdyCFlTf//V4MPIb3am+Q9nHHdNvcbzjGeMIMuaKEnFn8YNAkDy72Re
	C0X/3Q==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20sj2v8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 21:26:32 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c416b236so39276117b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786742792; cv=none;
        d=google.com; s=arc-20260327;
        b=JRrGSropV96R0a0k920KysTuuzifjNOdIPA925dj9RSyQaRUABFL6N9GkJpCaiQa/K
         POxkg3MPBq2g9yqTarpwuzsb+EY0P00mITEutOGjHuQg5QP2ZTmNVFwVO6EiktCbrADr
         GkHd4D4u/h8Bpaq720enOcJtFJHSWZmLb0usZ6tWB/q1YDbfYj1kOJEyMu4Ajq3RmFFD
         g21tmFBu8zuR/MXJgA3nbHn2V0y4bdxZ6gztDYJVrWclf/Dft9Vw4V0xVO/n02HJZCD3
         XbjMP2FFXwopFOsIhbJtJudlzwqPNRAY91uoL4/GivlUaZV48EHJ37VBQMjQZ5nY4RTP
         F1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zej0hJ3ojhA2wz5U7Y5qrHzGRc5LlV8oVkIjnWu4V6g=;
        fh=IRzMV15MMV9yknQ9GdaG8kGvCmwjt8vhQjJxEfr/EJ8=;
        b=QqRy/2Hz+LN3OGBdTDkKc8BYCgZBjF1LUo7+tKq0GWNJR548ojuX7TljUATLMBdehh
         hb0mKhS1OnmtuChPzVY76JOnvwPQ/IAm5IPiEcrFK8rZiGTCJatU+47F/wYw+BwN/eLN
         jSIxaeM6Wn0wIH1oJpJWSWrE71bcudfY1zCZBw7EMXCRXsY7QYp97GvwyPKAQtWKZmDe
         QjIUgfpsKeZxEkqiqUmrzzjwmzROydimz/k/I3AXjDt35agB7XUc9EBMadb5pL706v4c
         3a0AYuPNkfsw7ODH3x5V5YBvFLiFcpO8F8KNkPtIGk+1/4F1MwKurB+Yr1VesuFxHZkU
         cOtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786742792; x=1787347592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zej0hJ3ojhA2wz5U7Y5qrHzGRc5LlV8oVkIjnWu4V6g=;
        b=fhm3Gc4/FCctl2XMLY7XYN8VGrUuw/vhDv8D6N+01cH7mQldPNEHeqKDYEqVz8a999
         kosHb3zZIHlpcrZuK3SoV/lJgjSra7xtEuuQHcRI9SQyCLsq9itJuVQ4FdnqNETGJEPX
         2LR6McGdWi2xh/I7RryIdctip3Br2zOFyA6agCwB0mwJmkVC42uvQH7IpnNRSnIywF1S
         fs6k+i7pTGYsmKl6wSSR12PjO0N1Og7ID2Xu/pmr0PSQ8I2cfcpaxAdjITahzNRppvCG
         nOfqgUQD/vWzs66+MsePBgMpXux/hfjzvTaXc2tjEBCA0ILfX1gekMi5mEEr5jRCrikw
         lMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786742792; x=1787347592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zej0hJ3ojhA2wz5U7Y5qrHzGRc5LlV8oVkIjnWu4V6g=;
        b=sO3CeUIlGtLAiltdntILYJYRIsdfqEMr243yNvxav0mt3NcHQiIxllSpXZZqyXq0OY
         c51Ayg9FhEzZPB5Kdv90do70cXp6Qx1iQkzTbqJ3hDir/w2IS9bNtFjK+pNINf/9HkTA
         YEipLt4HLqg0dcOV42SDB7+cw9FaeL11vX3tEbJa/MZnqbVpKFYaL1ZISsJNioJzOTCJ
         5eCFgt1roAnrR0aWLfDr6RV+Sv66v805NJCGDSykr2xnpWlQD6kyywopR2kyU6HnnpCY
         EpuXiKvhTl7FetvN8LmciqsZS5ozSSOuFqbkRypPRFh9rkD1Wb5qr4Gze6J8wzeW11pO
         mm3g==
X-Forwarded-Encrypted: i=1; AHgh+RoXB9GqqwXo5djgav8SJpZxqr5WqvyOY/aOrGqUI6Neh39nqEzh9JnVTIgyQ2c/rDxoCg/YIfOuKuU3easW@vger.kernel.org
X-Gm-Message-State: AOJu0YybWHi9pbQqExOpQgdddIdfwUW5XX+Ssv0e+h1q2MAhR4A8EcsK
	smNSdRdNpjBwdpUrc52Fv1+ANi/a2Nutq7taebEOjRCIqWIiBjdj4OtKvV24Z9LstZ/g6wks9B1
	i26JX7pHahmtwRcdJ4XeieYcMZDkD1bMfDlAZB8P96tAf/wkijMgvLChyc2N8RwZaq3o2QEh2u/
	UHTwqykKZ6tXUGMcluKfdmw/dqQk1jKO5RNOq9O+ZTEeI=
X-Gm-Gg: AR+sD126Ortgd7n7qsq3n5hw8ga5g66snU59+IGDiNnqFGOGJziXx9L2niDWueaU/q4
	4CncGXuZQr4H2zxXDJHRb8Znggpm3AAEnev4iR/c1/VrAW0S/zdDf7n7yRI8bahmcSaSQDhkfYh
	kZdExX5GZkUlK1mi+1TWOU52f+0Qn4kuWsw+JAouKUOvR/gRLk/vQShYw=
X-Received: by 2002:a05:690c:9518:b0:81e:a3a0:701b with SMTP id 00721157ae682-8370d7e63abmr26103337b3.9.1786742791730;
        Fri, 14 Aug 2026 14:26:31 -0700 (PDT)
X-Received: by 2002:a05:690c:9518:b0:81e:a3a0:701b with SMTP id
 00721157ae682-8370d7e63abmr26102817b3.9.1786742790063; Fri, 14 Aug 2026
 14:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
In-Reply-To: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
From: Chris Obbard <chris.obbard@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 22:26:18 +0100
X-Gm-Features: AUfX_myS8jNgrlnuXOoRb2R2wxOXEBoiR140euEsyMe2J6IpgUjZvJpu1Ma18YQ
Message-ID: <CAPnEM6b49hbfaXKd1y+JmF2FXSv8CAxau4JuUmJRZbX0YTpdpA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE2NSBTYWx0ZWRfXwfMuvAuoBC+Q
 /haUgwM4XsNLH9oNWbxxWlAOxl41TdyE0iqIySj0j2gLMX6ZJQGSybMUxMvNnEv00t1UPIfVc2D
 FCrDXLr+lelVcM3+w0uDSFcwF3Xhi5mi/vnowN7cgrUe2PKCGr1BD6keK5mJ1K29sLtebFfLUtX
 VzZuR35jN2DrWe3kF85IrWyscnlJsYR69gRxUlOhcB/Wtkwct9IfO+TscM1K5I5xRQhYMaNqNGX
 lXJqZ1Q0iOaOCq6HP0eihvKdIWNNqmdVwHVA0ngwkaA9fgMRWvnCDONVCzZwmbgFwj66Pf1f+fv
 4Sh+9/Db23lOgQ7nhQv++JZxDkmownx1V6+R069DHTd/ar7FivRykWlOljWH4mvh4Tcap3Qs4uk
 Xh7sZzR/G5lN0U36/+6kgCD9CGxguJdsxfBp/vqblXymxbtfdhy+CxUs18YB2VmlxJhNmK3Xpe7
 bWhTvQ+HMbhNVT7CaYw==
X-Proofpoint-GUID: PiKqclxKTlbiJi7l2QnYB8fWWgL8CPGj
X-Proofpoint-ORIG-GUID: PiKqclxKTlbiJi7l2QnYB8fWWgL8CPGj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE2NSBTYWx0ZWRfX4QtjQTLC8d+O
 QtPZteglriAVdLBBba1MFZIxe53fpermm+hDznAV53s9xF9QKkHGXYqQxVf014l9iALbaV791FN
 i27keUI9Le9bFmQcWwcTSPSISNM5QnE=
X-Authority-Analysis: v=2.4 cv=cMTQdFeN c=1 sm=1 tr=0 ts=6a7f8808 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=orM8XNFxbhtbf6LyTpkA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140165

Hi Vinayak,

On Fri, Aug 7, 2026 at 6:51=E2=80=AFAM Vinayak Katoch
<vinayak.katoch@oss.qualcomm.com> wrote:
>
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766=
cc9ccb@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Thanks for the patch!

This fixes a boot loop on Qualcomm QRB2210 RB1 and Arduino UNO Q, I
wonder if we could add a suitable Fixes tag ?

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85..2064eed01327 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
>                         qcom,client-id =3D <1>;
>                         qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMI=
D_NAV>;
>                 };
> +
> +               adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +                       compatible =3D "shared-dma-pool";
> +                       alloc-ranges =3D <0x0 0x80000000 0x0 0x80000000>;
> +                       reusable;
> +                       alignment =3D <0x0 0x400000>;
> +                       size =3D <0x0 0x800000>;
> +               };
>         };
>
>         smp2p-adsp {
> @@ -2348,6 +2356,9 @@ fastrpc {
>                                         compatible =3D "qcom,fastrpc";
>                                         qcom,glink-channels =3D "fastrpcg=
link-apps-dsp";
>                                         label =3D "adsp";
> +                                       memory-region =3D <&adsp_rpc_remo=
te_heap_mem>;
> +                                       qcom,vmids =3D <QCOM_SCM_VMID_LPA=
SS
> +                                                     QCOM_SCM_VMID_ADSP_=
HEAP>;
>
>                                         qcom,non-secure-domain;
>
>
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-agatti-audio-357bcd74ae9c
>
> Best regards,
> --
> Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>
>
