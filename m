Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093900;
	b=cyat3ybD+WJjjhtRzIEzFH5eInnP02LQSju2DB8XuET15DQ5MutcjQv8wJgzBcQeuVt6
	 ZSI5k6NyI4sSxY2XohTMjb37yOLqHB8PrICJX11+hO/y5i2d5HsAscz8nS7X4hTR/upWM
	 kuAGt1TSEIpp1N7lQqYEzSc1lamsTyptzqHsAn78CE2b8957ivT+FYeXIzmL0pXcroBNb
	 EQyxsyUlpfXZIxZidfdHohDvQV9lS0a1FJBWIeanti4K5ydQLAKyeUplb5S6/HQalo96M
	 510Qkjiie31sV1AXKY4zCqS2WV/PgiEx6cVo4x/wTqyoJOfH1GIdvDzL0fv5hW50qig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UFkbhmoj5DEgqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=;
	b=YIzhjKYzWduxDMYNrGi+0YXuxK0Ei7pTbewPp1OhxqMyWxPTOIWlqzYQu6uhiOsf7DPO
	 nhohvC87eVY5vWwOzRDtPzbOXdEqR9fuAWKo+is2XtfEoDwpeZnnjHJYSoBZwb6DZDNxK
	 i6zLFZbPFV83UAeShM4CD8798PPAubLUAuJZuhmPAL+3Tw8BW/SKY9gZu+jwBbnUJf5H5
	 rbXb4tb+6Qsb27SPj1UsSBip9budQ6A/F3IhlPLVNwCQx3G+FUdxsHk/fsA3xAximD+Zo
	 I658fseeSbfknFHc3vUojsnY1YafGOxOoW23eFtezh6MVrOGyvcaWMan0YNSGiKzN7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3dL54E3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCI8VJLI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF25606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF25606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3dL54E3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCI8VJLI
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gaRJ1709081
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UFkbhmoj5DE
	gqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=; b=N3dL54E34a4N3pgNAq9hH6E99zM
	C6L1/9505bXIrMx9d/qeq0RbbDo/RPxtNy58B/XtLDyfDQuNhFYzDc/xRau0G1cE
	Y/awqXkCMINsxfv6yXIB1v1BZvoYaZ128CxG1sRdt9AYtklbeXz+s9FLoYRw9Edo
	Nvla4urewjc3lelcOYcnvQCcg+MNqEWsxL+tGk9xB7UV5LTXz1mIFI4RVi5a8RDq
	KLZ1GyNPg2ifXlg6LVb9kvCg+zzeSbVypo0Ss9keI1BZfobxWJxYrPzLamQzOY4g
	0hKG6blk9bJpl8f8CesIoTUTlq4buo+ibOsFuRVbehFTYbM8177bLRUf15g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xv5w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:38:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c71966998so5861576d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793093898; x=1793698698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFkbhmoj5DEgqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=;
        b=TCI8VJLIHh+B40XyQDFfNy07du1F7pWasolG8s4ybHRO0XjVUS68O5N91OMgt0LzC+
         bGaAlFobhGX1zhFN8ut3c7YGe2BvUxR8xkLKxONDAwiang6r/pb5ui9MX5rYshLa0jQh
         1nM+TGoiw/q4DxKTd8x7NDqtO+7F402qDhdSiOYGszdTRmJOsUtDoOkR8rMsXpgQTWoK
         QGU7B8oNqiA0oIvtUAEpW1kH/PJ+R6fRuqI9iya1i19sWDW1kr/6JNzPS2mGv8+ep8q3
         wjJPqQoifyYHc2nOOxU2XOsUSSv/Nu08YTNH1heMiHsXRCT7fSAbKU/d+3l/dkSVYm2D
         nHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093898; x=1793698698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UFkbhmoj5DEgqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=;
        b=ThHLkeWUS71ovCBlH7P1At6Y747Mz+8Q+zIoAT9x708/jpS9iib4c5b3hZJoh49VXg
         aA8nF2V9x1qeEWXY6zNpoNcO8n9ONvByxxhXma/uyEW4TcQ87VQ6qY94tOMtxL1+NYdI
         9A/lfLkWos7xw1end/YY1IFMohYkwo44E3B/yHE9yfVE9dVZLLLj+FmHP+dvDu/C+8fy
         kMmGZpLyRzSpIMlpXWw/7nyAtnZ5zZrXEieVPP94PNRCGDy6WlvW4vUI5VJya1KqHdX5
         kuwR0pGvc5J8F11+T0FJKbKi61QRYfR0J0Gst34sPeLf3cVgDpw4vH0bbXdmFtfEp3CZ
         eedw==
X-Forwarded-Encrypted: i=1; AKwUvBzJVBHEq+dAezmktNdylMcXLiw72HOAzDIBV3xOUYlmyuyrFpdXKfTymo9yXq1wTuGs4SeaWLF3TdypTI3M@vger.kernel.org
X-Gm-Message-State: AFq9FYL63ksOGAdAinI1opfwiOsOmOWlIYf7IMjlZMDbvBcqlCju7Zry
	OnKV4ji2GKPrgIK87yScnD+XRkZZ8bY9qP0+iWgrnghSal82S3ikXkUnPIF1fUXWdAyiAFnqVHP
	/jPnQCLMroZmBxg4xU0/ZjZUJu9FtxbZuCmeS9JWWBcUpDH7sIQAPJCwf41MUp7q5FNAu
X-Gm-Gg: AYBFou3oEUiAqNnP5wE0KPSEcS03G0rB4taswciwapDUxdurzZfaQopP/mJzH9zCvyC
	FlpZkKEOEz6/ML81YcYaKwoP17sUYS747vVz9fKzVXTSpan8aqzjy91wWrbKc0kpQ/7KBA/EEZ7
	pm9hcNUC0pt+riFvePg3NbEeHVjHGYvbBchmYJHq1BCXxyeHyKMBxe9dYyawLWtwtHg9axpO0Na
	TT0rFNkD6JVatCtQ0NXXY3PxCc/5Z+aevQGo/ALGoTB0KUK8J1F+3VElUx3HYbMrMEWl4yPMyLD
	KS/Fi5+Wf5Si74oEmxVaol14BfrmrjlcmB6G7VyLDgbH8KrXO/17od0hpmZaTCz0iPMy7xHvkuC
	DAhGrfPyd+qvg4LnM20nxSjBq
X-Received: by 2002:a05:620a:4001:b0:93c:ca09:aa34 with SMTP id af79cd13be357-940ef955604mr1315272585a.46.1793093898027;
        Tue, 27 Oct 2026 02:38:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:93c:ca09:aa34 with SMTP id af79cd13be357-940ef955604mr1315269685a.46.1793093897466;
        Tue, 27 Oct 2026 02:38:17 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm264678145e9.11.2026.10.27.02.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:38:16 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Tue, 27 Oct 2026 11:38:14 +0200
Message-Id: <20261027091922.3290180-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFEp6-2NoJEfH7cT1jwtHaeQW-__A7OeCJ2rY_j4f_65wHQM5A@mail.gmail.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com> <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com> <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org> <CAFEp6-2NoJEfH7cT1jwtHaeQW-__A7OeCJ2rY_j4f_65wHQM5A@mail.gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0OJO5K5nm9lgB6t6PWEPzGt0JS3VIh0J
X-Proofpoint-GUID: 0OJO5K5nm9lgB6t6PWEPzGt0JS3VIh0J
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6ae0710b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=-9N3Jim173-ToAEOIP4A:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX9boMwP+Ra7E7
 BATCECJa1hps60TCdVS6iPDAwzISrxbaNcWaIxw3mRz6iBVpIKR3ZEeavqpciHtyNjP4SxpuMYk
 HAChSNFzCk/oWfuSKiPY0sXDhJReC1ljvMKRapghVAWc8vuMf8CBBowGZi8bo4g7cgr8eg8E/iK
 GVTLDAWNY05Oq2Ee7bSk8q+c8UQw4MVr1+lTQ/oT2Foru9yyEMCR0FeMpEsl0A/9C5wE1RJjAKh
 d9yVfprJuEItzsK+pgMMOy9s1mR7RWHCTOzi3FISegSoE2nHFCmfRN5ukGByAF6HKlTO1MbqBsC
 v0a5w7UmXjfY6qXdpoGv3uq2A8FRlywpqYS7WCRcKBCmtGmBO52xhB/0gRpWeoVxn5KVLLYc5ML
 zzW+ThAi2rG84Z9tt9cA37gm5T2DwOMls5hNEwh9d/fJHxkkbpEykT4BrWqvtu9+LKIzYUZaEfc
 ekqCKscksxEP9eHGCeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX/AB0arTm0jRq
 ko8KPBWcrvg/AJS/aGsc+KHqqnIfZDBu9sGxtrxzryYJbFwfrxyLGQt5J9jiRfa+aVwhBj5gwwj
 apRptPuxC1ldHaAV73YexJPuKiS7/sc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270038

On Mon, Oct 26, 2026 at 4:24 PM Bryan O'Donoghue wrote:
> @Atanas could you keep -EINVAL for the VFE core clock and clamp only for
> the rest.

Will do. v4 follows your and Loic's comments: -EINVAL for the core
clock as before, the other clocks are clamped without a warning,
nothing else changes in this patch.

On Mon, Oct 26, 2026 at 4:43 PM Loic Poulain wrote:
> Yes, and we're adding one more in this series (AREG), so I saw this
> patch as a good opportunity to raise the issue and complain ;-)

Agreed. To be clear, the following does not affect v4, which stays
as above. It is only my view for a future CAMSS cleanup: the VFE
clocks are of three kinds, each with its own policy:

- own (vfeN, vfe_liteN): follow the pixel rate, a natural fit for OPP;
- internal (AREG, VFE AHB/AXI): not tied to the pixel rate, set as
  floors and aggregated by the clock framework;
- shared (camnoc_axi, GCC camera AXI): bandwidth driven, belong to
  interconnect votes next to icc_res_<soc>.

Today all three share one table and the policy is picked by name in
vfe_match_clock_names(), so every new clock needs another strcmp(),
and some listed rates are never applied.
Splitting the groups in the resource tables would make each policy
explicit and drop the name matching.

The enable order does not look deliberate either: camnoc_axi is first
on SDM845/SC7280, third on SM8250 and last on SM8550/SA8775P; vfe0 is
before cpas_vfe0 on SM8550 and after it on SA8775P.

Regards,
Atanas
