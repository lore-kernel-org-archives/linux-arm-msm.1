Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEE137AA9F
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 19:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572976; cv=none; b=qbvuzykc16J43nIdFaO5+rpG2ln0GCmmKMZEdrtkuQt07APT68INn4YBoupN98KlJtUqWHdK2rdwF8/dlojTcD+gbGOlAWYWIw0GZE7L8yQmDlVej74R/IKSP4A09VYEqdfCB9JaIxe7HDwG+RVYdLbZTmCaQQjc2Ex2JXMjms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572976; c=relaxed/simple;
	bh=enq4qEPadXLBj3ZEPOJuLUnc8Wm+dGgNBPwI0Y+P42g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHPmtQBKX/91BMMwI23QWzHdS2vNAhdup7itfl0MXqL6urVss3X13w7iqXQPPYAv1DgxL+jJRIymCbP/1H2tzW5pX+e/LDJXy5YM/7qnBD/lCOV/JBZ/CWe0Hmu9yy3orKlGppRAkqEXjZOFGrsXdKqPVuCcLBJQ32gVQrqO0tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bK3kjLUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibdr3lAL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bK3kjLUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibdr3lAL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZeqD1016261
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 19:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6RnvA+SzXeNiiPl6kbPgmaqN
	40rW8M++VLsuhxvpSuk=; b=bK3kjLUHOjAYMA64rylS13ZyomDlvdvhEncWYxZ+
	ZI4vYibVjFjiWx5Kvb5NEaC0GKtJT4UpldZlapoHSuLnKEziL/owKZCQkxbp9ZKr
	Y3P5tihtC8m0UCOlMZn0CprNhzTnTmRatsETNc9PGJa0SgF3+XtddUTy0PTMBWf6
	kktLxFjLzFXTGAnpQZmtH0LeofwlhIvPN6C0GD0vfK7oPAKbVi8fuhLc8aRxeEvT
	sZVsHNvAZ1+M52/C5CTqhdh9/CKbwyxC5O6PRkNWC3SW5inyg4XQv+yKi9lKy+VF
	qNK9xozcpWQ9bjG9+fyBUru+PVLI2IaT+Rh9Cb4Hesm5Dg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t88c54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 19:09:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso3624985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 12:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791572973; x=1792177773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RnvA+SzXeNiiPl6kbPgmaqN40rW8M++VLsuhxvpSuk=;
        b=ibdr3lAL5DEPQiALLodb2nIoF75S2KMnVuq5WmhF4vpC6KnzKMeZrbssAqZdjADVsQ
         SnMe6PT0idm8QA7qIKMR7bKGljfJ/bgqRRgUAk1OeGqdp4SsI0E6SfEKRQdMQJjK7Tsr
         U5c+xjPlFA7H0Jf5PkwjaPXV6wKQ2acW6ZDxMRvxrJdJyZVylFSV4B9B7vfEgxheVotv
         YLjATZt6D/B+KD+rGfvhp2mVe3URyr2UOtFG5vI0JsgYV7/VKBdlD13UM4aiVck4F0k6
         jkVHKAAWQQ5UQjAX7pvnEBRIWBx6w+tgUxIKTMnurWB2eTjN5F+07vNkIRkflReT+qKg
         Z1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572973; x=1792177773;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RnvA+SzXeNiiPl6kbPgmaqN40rW8M++VLsuhxvpSuk=;
        b=BYuhUidyCwoZlPulCyiosQ71yki+SC3QOkbFKZw7M7bBuVtYI9zJpqdH2scQnmRFfx
         sooHEG8Ge1hLiVgbj9+Wm+Z+g1JjK5bzK6kwpG4OplZ7tPhCY8TXDEP5aB7OQYdsckCS
         CAPzgQ3UJ+jab4E5uYKMjvh6iRhCULozI09ZO3kWfw91Cc9jDoWN4DstyssasktFTu5q
         KEryULIAWGsLpkjgq6370DcbdAdDfjRUZtCU0CHXhjM9wP+4XpFDjrLMl0dUI9JysuA/
         M/Hod60Pwl1nUcZR4qp3XLPzXcmwnblXELPoaKtIIVE6MwfwucB/Ih1I46niLjIfn2QP
         hujg==
X-Forwarded-Encrypted: i=1; AKwUvBzoT6JbTdaLVM82GpDkSE/56cGzjYGhHlJl9vByp4MaWnoPjvTWnVZTlIRUutbMhWugB/T3SisflhJOd7Lz@vger.kernel.org
X-Gm-Message-State: AFuF++nY1HO/cx8lwuA5W7MDF63GIHzflNquEnG1zmmihfJeJUNPPell
	XY1pwicDsb2kw4GThR1Defn1x5k4hJMuT0qZAXSCASYWNJk9h4CM5wfJCm3LW99ivaJ7g6eWy1X
	zIr+njt+JRP3QONAVf7asKUYqHIV/TBrT2O1mGUQVFCv6g1EKtV/I9HcVQsIAYUCWLLGx
X-Gm-Gg: AYBFou3lf80lD1FDmN9RbNtp4ktTeSg3q6tot2sy5nB5NTkpJXwlOJwnnMGY0CIaIUf
	XgT0dBshtAf88chlxHWb32/P2CixR6riVoqUnBWUxKqsfIV9SQ2yOAdvTYIqSG9iJ7SZ0fMizVD
	Iez2naAnvtoUbcSY+JOFcQLhs9u1rsT6S8v7JzjdQuzN4stcqKpKFNEkCK9d6B1e8ddOGmGB7wd
	GpZqDX/NgQySDydK27fz9cHRTIVucPaPEBHXJL0EWy0ScdTywH1hSe8uyTpCU2C2mtjw14rapU4
	VyPwv7N+NEp1xH00rK6iLoedRMzU/mQ/CZhZDcHeUaIW0f2T57GbbsRRwxumbADldbXUOuUpOE9
	KCDzaGVW9gEPwBLA=
X-Received: by 2002:a05:620a:2715:b0:93e:5677:317b with SMTP id af79cd13be357-93eb96549cbmr498463785a.25.1791572973249;
        Fri, 09 Oct 2026 12:09:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2715:b0:93e:5677:317b with SMTP id af79cd13be357-93eb96549cbmr498458985a.25.1791572972648;
        Fri, 09 Oct 2026 12:09:32 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2e0dbsm78770315e9.11.2026.10.09.12.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:09:31 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:09:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: juerg.haefliger@canonical.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1-hp-omnibook-x14: Consolidate
 pmics and chassis
Message-ID: <sie22supg25mtwcsekvu7sry4z4uuxmftupekpypltc3lewpsi@n7eal23pgkss>
References: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
 <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-1-9702f7c6f9a0@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-1-9702f7c6f9a0@canonical.com>
X-Proofpoint-ORIG-GUID: yAeKznAeURhP-2LbOrQnCSIa5dgP8cx9
X-Proofpoint-GUID: yAeKznAeURhP-2LbOrQnCSIa5dgP8cx9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX8lO2e4W6Cppp
 AqeesPF+mZutZ2RLz48oQbH7lIdp2tCwPuPXRCiv7YdrwylCJgKnun9hLNsv0+H/92oJ1+VVzTZ
 r04hsc2+PbpM6QzQBJhZUyC4pXrm8Bo=
X-Authority-Analysis: v=2.4 cv=JuNkP84C c=1 sm=1 tr=0 ts=6ac93bee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=tb8V0W7vhrSWw5vyytIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX2oYPDkTDugqW
 iDYuQhhisXwPLQKCMhsPZ5wQYx7JIrNzK7PTYUy3u7cKSgpItGrtKrTiGMdukDh6q20zS9I0ydX
 viOzyr3+x2aEgm/L78KKCfn7F1h/QEJmF3nKEOnVBdhOaRQMzkbEQpukHdwfTZmHO8QpX93xADd
 F8dlS3HrzZ2hOhWYf3khYAybzyxvG5lz32WE5Rff2XGEnzBCWzwDbyQtU4ND9ANK1v2Sk6JtSLF
 I2aLPr4U9MFWq/tN2tY2Rck8mXO3CLu2QQrMNRsgRflUSbCaDzplcQHbGX2X/rAaGIu3C5+B9ai
 499TKVMTC1R6GbtokGgh0kTmGt8m2ox510sFZgCvsT6e6vuKmWI2rE7voZonP4hVjO8yiWCnVMf
 o0wjrPzUSALsS+ioYFSXFChI6Eb9EtjXGlfmIIuz8l2uvwI2q/gspkpY//owSrvwAyp7OATor6B
 E4ZusIXxjRC1hnir6fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090076

On 26-10-08 20:34:45, Juerg Haefliger via B4 Relay wrote:
> From: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> hamoa-pmics.dtsi and chassis-type are identical across the HP Omnibook X14
> boards that include this shared dtsi, so move them there.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
