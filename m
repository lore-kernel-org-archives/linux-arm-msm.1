Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BE40B373
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374410; cv=none; b=E9ZMk7IduqCH3x8KjW6QnSfgZR0oCnqTQrCih481l2ofAXO1lTHqHTZoGjm5kVAA8SYAMktoUVCH29rdtau950AKYuU3r4zmmLPmOC30NZ2Wexnv3PRYdQQ0UMU92ltG5u72u2Vy51CFFJg4Z4YwSw1iJjD8jZPO6cwgRK/ZDgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374410; c=relaxed/simple;
	bh=TA26xEZ/LjJXtkH+wc6rh6u0nbvSN8fi3WWcPpbpONU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDqWOZUTI4OT85m26Ufi/KkqgxoNPULjPTLMTc9xY4X9OgORzyvtqyahUylNb2aGe+9uz7EO4Lh6oJd4BD07hJkQdsy4etaTYi3V6Uk0Pur45SEpUDo9F/TA+0J8/PTpF59wNfnw8u84nVYG+gH90uOWh2RbVcXc4k06Wp2Ulhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7rZ64Er; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7rZ64Er"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F49C1F0089E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374407;
	bh=e6EWldjLUV164UHYmg9SwSNk9vpahiavUGimVKHnqTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S7rZ64Er9f2J3r71j+Ra/t2dR0m3MCQd2lZWyIajqu/P1gyoxwditamSmJAhvxfLO
	 oPuqEeUZCXSPfct5Y87skLbFYzdxrBs7ygzvAI1ulhvODDeH36Yy4wapVKHZPMta6V
	 qIosKNt2T6yX/nNiiwHxrqRS5JDVDo+RH2e7LJLdLwtV5R1W0nJdzhIK2Vzu5m+ATB
	 rfIubf7stDTGlVK6riX994NejNaH1p6zZQ7VN41kJTqT93rPJIumty0w/xQRmcW+dk
	 /+zwsJ/MZoiBqKepzlCCkPLfbDXMjS0GneU9PtrZOkKHWMV7u/AmzKmfTX45sGS/ID
	 DxVr/E2qiV97g==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso1606207e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:26:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4sqLFTuRf1YHl6/XPNRT3W9BhyWWeVzpKDJZNmP858ZFOdYDkT2POUXk7/6npp/0v6r8fQ6OYesaaFTl9@vger.kernel.org
X-Gm-Message-State: AFuF++mofQQAbJD9OifenyB0bKtEDCBf5N6QS9VAYn7cyNBP+AoDCu0G
	on2SA/q0PoEWiUC6hagk2niIh1MN3mitULoJ6uTYh5GXuacNMR4QkhmpHfL3WZr6YkCfWeBz2J1
	7of0q5xu+aKPt5OzHmAg0VhwuMX08usc=
X-Received: by 2002:a05:6512:239f:b0:5b6:184c:7da3 with SMTP id
 2adb3069b0e04-5b8ae6afb21mr372849e87.44.1789374406193; Mon, 14 Sep 2026
 01:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com> <ac236a52-1293-4a70-b5ea-ec6118cb02e1@oss.qualcomm.com>
In-Reply-To: <ac236a52-1293-4a70-b5ea-ec6118cb02e1@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:26:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLnmH31iNsOeB7CWWpxkav6qxRgU6-tp=gxZxwWz3KUupA@mail.gmail.com>
X-Gm-Features: AcwNN1UxxQOsVcBHVbSaj8l-dq0hp_W-v71JNdK8T8AJOQnCtU1FStuksPYcjMI
Message-ID: <CAD++jLnmH31iNsOeB7CWWpxkav6qxRgU6-tp=gxZxwWz3KUupA@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, Georgi Djakov <djakov@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 8:43=E2=80=AFAM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> Several patches from the series have already been picked up and applied
> through their respective subsystem trees.
>
> The remaining patches listed below are ready to be picked up as well:
>
>   [PATCH v5 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
>   [PATCH v5 07/15] interconnect: qcom: Add Kuno interconnect provider dri=
ver
>   [PATCH v5 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
>
> Since the majority of the series has already been applied, I would
> appreciate it if the remaining patches could also be considered for
> inclusion.
>
> Please let me know if there are any outstanding concerns or additional
> changes required from my side.

6+7 looks like stuff Georgi should pick up, patch 14 looks like something
Bjorn should apply to the Qcom SoC tree.

Yours,
Linus Walleij
